import java.io._
import scala.io.Source
import org.fusesource.scalate.TemplateEngine

object Generator extends App {

  val engine = new TemplateEngine
  val outputFile = new File("index.md")
  val resources = "src/main/resources"
  val contentFolder = new File(outputFile.getParentFile, resources)
  val webPath = contentFolder.toURI

  val author0 = Contributor("author")
  val author1 = Contributor("author1")
  val author2 = Contributor("author2")
  val author3 = Contributor("author3")
  val author4 = Contributor("author4")
  val author5 = Contributor("author5")

  val intialLayout = Task("Initial HTML layout", Some(TaskId("1", "https://github.com/ThStock/logbooks/issues/1")),
    Seq("New layout added", "Font size applied"),
    Seq(author2))

  val sampleData = Task("Sample data", Some(TaskId("SUBTASK-2")),
    Seq("PROBLEM-000000 added",
      "miscellaneous section added",
      "a view lines of scala for transformation added"
      ), Seq(author4))

  val tooLong = Task(
    "A very long subject .. maybe too long, to be shown in a single line .." +
    " I hope the automatic word wrapping works well",
    Some(TaskId("PROBLEM-000000")), Seq("Nothing was changed"), Seq(author0)
    )

  val misc = Task("Misc", None, Seq(
    "I've no idea what I've changed",
    "A misc line added",
    "A set of authors forged"
    ), Seq(author0, author1, author2, author3, author4, author5))

  val tasks = Seq(intialLayout, sampleData, tooLong, misc)

  val map = Map(
    "owner" -> "ThStock",
    "previousVersion" -> "0",
    "version" -> "1.0",
    "title" -> "logbooks",
    "tasks" -> (tasks),
    "metaLines" -> Seq("log v.0..v1.0 # 2010-10-10T12:12:12 @83b7ef")
    )

  writeToFile(toHtml(map), outputFile)

  case class TaskId(id:String, _url:String = "#") {
    def url:Option[String] = _url match {
      case "#" => None
      case urlValue:String => Some(urlValue)
    }
  }

  case class Contributor(name:String, email:String = "")

  case class Task(title:String, id:Option[TaskId],
    details:Seq[String], contributors:Seq[Contributor])

  def toTemplate(pathTo:String, fileName:String, map:Map[String,AnyRef]):String = {
    val text = Source.fromInputStream(getClass.getResourceAsStream(pathTo + fileName)).mkString
    val template = engine.compileMoustache(text)
    return engine.layout("",template, map.toMap)
  }

  def toHtml(map:Map[String,AnyRef]):String = {
    return toTemplate("", "md.mu", map)
  }

  def writeToFile( s: String, file:File) {
    val out = new PrintWriter(file, "UTF-8")
    try{ out.print( s ) }
    finally{ out.close }
  }

}
