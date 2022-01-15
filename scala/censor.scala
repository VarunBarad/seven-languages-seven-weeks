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
	val words = List(
		"Book",
		"Shoot",
		"Mom",
		"Floor",
		"Heart",
		"Darn"
	)

	val censor = new CensorImpl()

	words.map(word => censor.doIt(word)).foreach(word => println(word))
}
