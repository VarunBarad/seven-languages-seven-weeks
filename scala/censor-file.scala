import scala.io.Source

trait Censor {
	val dictionary = Map(
		"Shoot" -> "Pucky",
		"Darn" -> "Beans"
	)

	def doIt(word: String): String = {
		return dictionary.getOrElse(word, word)
	}
}

class CensorImpl extends Censor

object Main extends App {
	val censor = new CensorImpl()

	val source = Source.fromFile("words.txt")

	source.getLines()
		.map(word => censor.doIt(word))
		.foreach(word => println(word))

	source.close()
}
