val messages = List("one", "two", "three")
val totalLength = messages.foldLeft(0)((sum, message) => sum + message.length)
println(totalLength)
