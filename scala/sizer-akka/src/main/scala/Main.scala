import akka.actor.typed.scaladsl.Behaviors
import akka.actor.typed.{ ActorSystem, Behavior }
import scala.io._

object PageLoader {
  def getPageSize(url: String): Int = {
    val source = Source.fromURL(url)
    val length = source.mkString.length
    source.close()

    length
  }
}

object Utils {
  val urls = List(
    "https://varunbarad.com",
    "https://varunbarad.com/contact/",
    "https://varunbarad.com/blog/",
    "https://varunbarad.com/blog/improvement-roll",
    "https://varunbarad.com/blog/til-list-files-in-a-git-commit",
    "https://varunbarad.com/blog/til-centering-elements-with-css",
    "https://varunbarad.com/blog/cheatsheet-imagemagick",
    "https://varunbarad.com/blog/til-resizing-images-from-command-line",
    "https://varunbarad.com/blog/cheatsheet-youtube-dl",
    "https://varunbarad.com/blog/comparing-two-BigDecimal-instances",
  )

  def timeMethod(method: () => Unit): Unit = {
    val start = System.nanoTime
    method()
    val end = System.nanoTime
    println("Method took " + (end - start) / 1000000000.0 + " seconds")
  }

  def getPageSizeSequentially(): Unit = {
    for (url <- urls) {
      println("Size for " + url + ": " + PageLoader.getPageSize(url))
    }
  }

  def getPageSizeConcurrently(): Unit = {
    val actorSystem: ActorSystem[UrlSystem.CalculateSize] = ActorSystem(UrlSystem(), "system")

    actorSystem ! UrlSystem.CalculateSize(urls)
  }
}

object UrlSizer {
  final case class Url(url: String)

  def apply(): Behavior[Url] = Behaviors.receive { (context, message) =>
    println("Size for " + message.url + ": " + PageLoader.getPageSize(message.url))
    Behaviors.same
  }
}

object UrlSystem {
  final case class CalculateSize(urls: List[String])

  def apply(): Behavior[CalculateSize] = Behaviors.receive { (context, message) =>
    val actor = context.spawn(UrlSizer(), "actor")
    for (url <- message.urls) {
      actor ! UrlSizer.Url(url)
    }
    Behaviors.same
  }
}

object Main {
  def main(args: Array[String]): Unit = {
    println("Concurrent run:")
    Utils.timeMethod { Utils.getPageSizeConcurrently }

    println("Sequential run:")
    Utils.timeMethod { Utils.getPageSizeSequentially }
  }
}
