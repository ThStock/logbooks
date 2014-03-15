<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <title>{{{title}}} - {{{version}}}</title>
  <link href='http://fonts.googleapis.com/css?family=Roboto:400,400italic,700,700italic&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
  <meta name="viewport" content="width=device-width, initial-scale=1, minimal-ui">
  <style>
    body {
      background-color: #F5F5F5;
      font-family: 'Roboto', sans-serif;
      margin: 1em;
      max-width: 42em;
    }
    @media all and (max-width: 768px) {
      body {
       max-width: 100%;
      }
    }
    .task, .footer {
      padding-top: .7em;
      clear: both;
    }
    .task .details {
      font-size: 95%;
    }
    .badges {
      float: right;
      padding-left: .2em;
      max-width: 10em;
      text-align: right;
      padding-top: .5em;
      padding-right: 0;
    }
    .badges img {
      border: solid .2em #ccc;
      background-color: #ccc;
      border-radius: .4em;
      vertical-align: middle;
      margin-right: .2em;
      margin-left: 0em;
      width: 32px;
      margin-bottom: .44em;
    }
    img.logo {
      float: right;
      border: solid .2em #ccc;
      border-radius: .5em;
      width: 49px;
      margin-right: .2em;
      margin-top: .1em;
    }
    img.reviewer, .job.reviewer {
      border-color: green;
      background-color: green;
    }
    img.committer, .job.committer {
      opacity: 0.2;
    }
    ul li {
      font-size: .8em;
    }
    @media screen and (device-aspect-ratio: 40/71) {
      ul li {
        font-size: .7em;
      }
    }
    @media screen and (device-aspect-ratio: 40/71) and (orientation : landscape) {
      ul li {
        font-size: .5em;
        margin-left: 1.5em
      }
      .task h4 {
        font-size: .6em;
      }
    }
    ul {
      padding-left: 1.5em
    }
    .title strong {
      color: silver;
      padding: 0 .25em 0 .3em;
    }
    .title strong a {
      color: #4183C4;
    }
    h5, h4, h2, body ul, body p {
      margin: 0;
    }
    h3 {
      font-weight: normal;
      margin-top: 0;
      margin-bottom: 0;
    }
    h4 {
      border-top: 1px solid silver;
      padding-top: .3em;
      font-size: 80%;
    }
    h2, h3, h4, h5 {
      padding-left: .3em;
      padding-right: .3em;
    }
    .header {
      border-bottom: 1px #ddd solid;
      margin-bottom: .3em;
      text-align: right;
      padding-right: .3em;
      padding-bottom: .2em;
    }
    .header-notes {
      float: left;
      font-family: monospace;
      padding-top: .4em;
      padding-left: .2em;
    }
    .footer {
      text-align: right;
      margin-top: 1em;
      border-top: 1px solid #ddd;
      font-family: monospace;
      padding-top: .3em;
      padding-right: .3em;
      padding-bottom: .3em;
    }
    .footer small, .header-notes small {
      color: silver;
      font-size: 70%;
    }
    .footer .job {
      font-size: 100%;
    }
    .outer {
      border: 1px #ddd solid;
      border-radius: 5px;
      padding: .3em;
      color: #444;
      background-color: #fff;
    }
    .job {
      height: .3em;
      width: 3em;
      border: .2em solid silver;
      background-color: silver;
      border-radius: .5em;
      font-size: .1em;
      margin-right: .2em;
    }
    .expand {
      display:inline-block;
      margin-left:5px;
      background-color: #F5F5F5;
      border: 1px solid #ccc;
      border-radius: .2em;
      vertical-align: middle;
      margin-bottom: 2px;
      height: 10px;
    }
    @media screen and (device-aspect-ratio: 40/71) {
      .expand {
        display:inline-block;
        margin-left:5px;
        background-color: #F5F5F5;
        border: 1px solid #ccc;
        border-radius: .2em;
        vertical-align: top;
        font-size: 200%;
        height: .7em;
        width: 2em;
      }
    }
    @media screen and (device-aspect-ratio: 40/71) and (orientation : landscape)  {
      .expand {
        margin-top: .2em
      }
    }
    .expand:hover {
      background-color: #ddd;
    }
    .expand.active, .expand.active:hover {
      background-color: #4183C4;
    }
    .expand A {
      text-decoration: none;
      vertical-align: super;
      cursor: pointer;
      font-size: .7em;
      padding: 0;
      padding-right: .2em;
      padding-top: 1px;
    }
    .expand A SVG {
      margin-left: .3em;
      width: 2em;
      fill: #ccc;
    }
    .hidden {
      display: none;
    }
  </style>
  <script type="text/javascript">
    function toggleDetails(element) {
      var sliced = function(e) { return Array.prototype.slice.call(e); }
      var expanderSpan = element.parentNode;
      var taskElemets = sliced(expanderSpan.parentNode.parentNode.childNodes);
      var isClass = function(className) {
        return function(e) {
          return e.className != undefined && e.className.indexOf(className) != -1;
        }
      };
      var toggleClassName = function(originalClassName, toggleClassName) {
        return function(element) {
          var className = element.className;
          if (element.className != originalClassName) {
            element.className = originalClassName;
          } else {
            element.className = originalClassName + " " + toggleClassName;
          }
          return element;
        }
      };
      var typeFilter = function(typeName) {
        return function(element) {
          return element != undefined && element.localName === typeName;
        }
      }

      var toChildElementOfType = function(elementName) {
        return function(element) {
          var ul = sliced(element.childNodes) //
            .filter(typeFilter(elementName));
          return ul;
        }
      }

      var first = function(element) {
        return element[0];
      }

      taskElemets
        .filter(isClass("details"))
        .map(toChildElementOfType("ul"))
        .map(first)
        .map(toChildElementOfType("li"))
        .forEach(function (liElements) {
          liElements
            .filter(isClass("detail"))
            .map(toggleClassName("detail", "hidden"));
          })
        ;
      toggleClassName("expand", "active")(expanderSpan);
    }

  </script>
</head>
<body>
  <div class="outer">
    <div class="header-notes">&zwnj;<small>{{{title-notes}}}</small></div>
    <div class="header">{{{owner}}}</div>
    <img src="{{{logoImg}}}" class="logo" />
    <h2>{{{version}}}</h2>
    <h3>{{{title}}}</h3>

    {{#tasks}}

    <div class="task">
      <div class="badges">
        {{#contributors}}
        <img src="http://lb.gravatar.com/avatar/{{{hash}}}?d=https%3A%2F%2Fidenticons.github.com%2F{{{hash}}}.png&amp;s=52" title="{{{name}}}" class="{{{job}}}"/>
        {{/contributors}}
      </div>
      <h4 class="title">{{{title}}} {{#id}}<nobr>(<strong>{{#url}}<a href="{{{url}}}">{{{id}}}</a>{{/url}}{{^url}}{{{id}}}{{/url}}</strong>)</nobr>{{/id}}{{#hasDetails}}
        <span class="expand"><a onclick="toggleDetails(this);">
          <svg>
            <rect x="2"  y="4" width="2" height="2" />
            <rect x="8"  y="4" width="2" height="2" />
            <rect x="14" y="4" width="2" height="2" />
          </svg>
        </a></span>{{/hasDetails}}
      </h4>
      <div class="details">
        <ul>
          {{#detailsLeft}}
          <li>{{{.}}}</li>
          {{/detailsLeft}}
          {{#detailsRight}}
          <li class="detail hidden">{{{.}}}</li>
          {{/detailsRight}}
        </ul>
      </div>
    </div>

    {{/tasks}}

    <div style="clear: both;"></div>
    <div class="footer">
      <small> {{#metaLines}}
        {{{.}}}<br />
        {{/metaLines}}
        Legend:
        <span class="job">&nbsp;</span>author
        <span class="job reviewer">&nbsp;</span>reviewer
        <span class="job committer">&nbsp;</span>committer
      </small>
    </div>
  </div>
</body>
</html>
