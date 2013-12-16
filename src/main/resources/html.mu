<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <title>{{{title}}} - {{{version}}}</title>
  <link href='http://fonts.googleapis.com/css?family=Roboto:400,400italic,700,700italic&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <style>
    body {
      font-family: 'Roboto', sans-serif;
      max-width: 42em;
      font-size: 88%;
    }
    @media all and (max-width: 768px) {
      body {
       max-width: 100%;
      }
    }
    .badges {
      float: right;
      max-width: 10em;
      text-align: right;
    }
    .badges img {
      border: solid .2em #ccc;
      background-color: #ccc;
      vertical-align: middle;
      margin-right: .2em;
      margin-left: 0em;
      width: 32px;
      margin-bottom: .44em;
    }
    img.logo {
      float: right;
      border: solid .2em #ccc;
      width: 49px;
    }
    img.reviewer, .job.reviewer {
      border-color: green;
      background-color: green;
    }
    img.committer, .job.committer {
      opacity: 0.2;
    }
    .header {
      text-align: right;
    }
    .header-notes {
      float: left;
    }
  </style>
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
      <h4 class="title">{{{title}}} {{#id}}<nobr>(<strong>{{#url}}<a href="{{{url}}}">{{{id}}}</a>{{/url}}{{^url}}{{{id}}}{{/url}}</strong>)</nobr>{{/id}}</h4>
      <div class="details">
        <ul>
          {{#details}}
          <li>{{{.}}}</li>
          {{/details}}
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
