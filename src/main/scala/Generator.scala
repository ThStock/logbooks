import java.io._
import scala.io.Source
import org.fusesource.scalate.TemplateEngine

object Generator extends App {

  val author0 = Contributor("author@example.org")
  val author1 = Contributor("author1@example.org")
  val author2 = Contributor("author2@example.org")
  val author3 = Contributor("author3@example.org")
  val author4 = Contributor("author4@example.org")
  val author5 = Contributor("author5@example.org")

  val reviewer = Contributor("reviewer@example.org", "reviewer")
  val commiter = Contributor("commiter@example.org", "committer")

  val intialLayout = Task("Initial HTML layout", Some(TaskId("1", "https://github.com/ThStock/logbooks/issues/1")),
    Seq("New layout added", "Font size applied"),
    Seq(author2, reviewer, commiter))

  val sampleData = Task("Sample data", Some(TaskId("SUBTASK-2")),
    Seq("PROBLEM-000000 added",
      "miscellaneous section added",
      "a view lines of scala for transformation added"
      ), Seq(author4))

  val tooLong = Task(
    "A very long subject .. maybe too long, to be shown in a single line .." +
    " I hope the automatic word wrapping works well",
    Some(TaskId("PROBLEM-000000")), Seq("Nothing was changed"), Seq(author0, reviewer)
    )
  val misc = Task("Misc", None, Seq(
    "I've no idea what I've changed",
    "A misc line added",
    "A set of authors forged"
    ), Seq(author0, author1, author2, author3, author4, author5))

  val map = Map(
    "owner" -> "ThStock",
    "logoImg" -> "http://lorempixel.com/100/100/abstract/",
    "version" -> "1.0",
    "title" -> "logbooks",
    "title-notes" -> "v.0..v1.0",
    "tasks" -> Seq(intialLayout, sampleData, tooLong, misc),
    "metaLines" -> Seq("git log v.0..v1.0 # 2010-10-10T12:12:12 @83b7ef")
    )

  Seq("md", "html").map(e => writeToFile(toTemplate(e + ".mu", map), new File("index." + e)))

  case class TaskId(id:String, _url:String = "#") {
    def url:Option[String] = _url match {
      case "#" => None
      case _ => Some(_url)
    }
  }
  case class Contributor(email:String, _job:String = "") {
    def hash = md5(email)
    def job:Option[String] = _job match {
      case "" => None
      case _ => Some(_job)
    }
    def name = email.replaceFirst("@.*", "")
  }
  case class Task(title:String, id:Option[TaskId],
    details:Seq[String], contributors:Seq[Contributor])

  lazy val engine = new TemplateEngine
  def toTemplate(fileName:String, map:Map[String,AnyRef]):String = {
    val text = Source.fromInputStream(getClass.getResourceAsStream(fileName)).mkString
    val template = engine.compileMoustache(text)
    return engine.layout("",template, map.toMap)
  }

  def writeToFile( s: String, file:File) {
    val out = new PrintWriter(file, "UTF-8")
    try{ out.print( s ) }
    finally{ out.close }
  }

  def md5(s: String):String =  {
    import java.security.MessageDigest
    return MessageDigest.getInstance("MD5")
    .digest(s.getBytes).map("%02x".format(_)).mkString
  }
}
