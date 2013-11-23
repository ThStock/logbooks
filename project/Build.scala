import sbt._
import Keys._

object ProjectBuild extends Build {

  override lazy val settings = super.settings ++
  Seq(scalaVersion := "2.10.3", resolvers := Seq())


  val appDependencies = Seq(
    "com.typesafe" % "config" % "1.0.2",
    "org.fusesource.scalate" %% "scalate-wikitext" % "1.6.1",
    "org.fusesource.scalate" %% "scalate-page" % "1.6.1"
    )

  val appResolvers = Seq(
    "Typesafe Repo" at "http://repo.typesafe.com/typesafe/releases/"
    )

  lazy val root = Project(
    id = "logbooks",
    base = file("."),
    settings = Project.defaultSettings ++ Seq(
      libraryDependencies ++= appDependencies,
      resolvers ++= appResolvers)
    )

}
