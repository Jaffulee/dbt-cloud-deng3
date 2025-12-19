<!-- README.html -->

<p><a href="https://jaffulee.github.io/Jaffulee/">Visit my website</a></p>

<h1>deng3-dbt-analytics</h1>

<p><strong>dbt Cloud Analytics Project</strong><br>
Transforming raw Amplitude and Mailchimp data into trusted, analytics-ready models.</p>

<ul>
  <li>GitHub: <a href="https://github.com/Jaffulee">https://github.com/Jaffulee</a></li>
  <li>LinkedIn: <a href="https://www.linkedin.com/in/jeffrey-brian-thompson/">https://www.linkedin.com/in/jeffrey-brian-thompson/</a></li>
  <li>Writing: <a href="https://www.thedataschool.co.uk/blog/jeffrey-brian-thompson/">https://www.thedataschool.co.uk/blog/jeffrey-brian-thompson/</a></li>
</ul>

<hr>

<h2>About</h2>

<p>
This repository is a <strong>snapshot of my work in dbt Cloud</strong>, focused on modelling and transforming data extracted from <strong>Amplitude</strong> and <strong>Mailchimp</strong>.
</p>

<p>
It represents the <strong>analytics engineering layer</strong> of a broader data pipeline, sitting downstream of Python-based API extractions and upstream of BI and reporting use cases.
</p>

<p>
The emphasis of this project is on:
</p>

<ul>
  <li>Clean, well-layered SQL models</li>
  <li>Refactoring ad-hoc SQL into maintainable dbt patterns</li>
  <li>Clear documentation, lineage, and testability</li>
</ul>

<hr>

<h2>End-to-End Context</h2>

<p>
This dbt project builds on two upstream extraction pipelines:
</p>

<h3>Amplitude — Product Analytics</h3>

<ul>
  <li><strong>Extraction repository:</strong>
    <a href="https://github.com/Jaffulee/deng3-amplitude">https://github.com/Jaffulee/deng3-amplitude</a>
  </li>
  <li><strong>Source:</strong> Amplitude Export API</li>
  <li><strong>Data characteristics:</strong> Event-level JSON, high volume, nested properties</li>
</ul>
<p>
The schema below illustrates an example relational structure derived from raw Amplitude
event data. This diagram was used as a <strong>reference point when refactoring exploratory
SQL into layered dbt staging, intermediate, and mart models</strong>.
</p>

<p>
<img
  src="https://github.com/user-attachments/assets/c09bd393-3a74-4ebe-a08e-9d2703e049b8"
  alt="Amplitude example downstream schema"
  width="100%"
/>
</p>



<h3>Mailchimp — Marketing Analytics</h3>

<ul>
  <li><strong>Extraction repository:</strong>
    <a href="https://github.com/Jaffulee/deng3-mailchimp">https://github.com/Jaffulee/deng3-mailchimp</a>
  </li>
  <li><strong>Source:</strong> Mailchimp Marketing API</li>
  <li><strong>Data characteristics:</strong> Campaign metadata and email-level engagement data</li>
</ul>
<p>
The schema below shows an example downstream structure for Mailchimp campaign and
email activity data. This schema was used as a <strong>guiding reference when refactoring
raw extracts into dbt staging, intermediate, and mart models</strong>.
</p>

<p>
<img
  src="https://github.com/user-attachments/assets/62838eb1-2130-4091-8cbc-8c02806d0a85"
  alt="Mailchimp example downstream schema"
  width="100%"
/>
</p>

<p>
Raw JSON data is extracted via Python, uploaded to S3, and ingested into the data warehouse before being transformed with dbt.
</p>

<hr>

<h2>Modelling Approach</h2>

<p>
Models follow a <strong>layered dbt structure</strong>:
</p>

<ul>
  <li>
    <strong>Staging</strong>
    <ul>
      <li>One-to-one with raw source tables</li>
      <li>Type casting, renaming, light cleanup only</li>
      <li>No business logic</li>
    </ul>
  </li>

  <li>
    <strong>Intermediate</strong>
    <ul>
      <li>Reusable transformation logic</li>
      <li>Flattening nested fields</li>
      <li>Standardised timestamps and identifiers</li>
    </ul>
  </li>

  <li>
    <strong>Marts</strong>
    <ul>
      <li>Analytics-ready fact tables</li>
      <li>Clear grain and documented measures</li>
      <li>Designed for reporting and BI tools</li>
    </ul>
  </li>
</ul>

<p>
This structure mirrors a <strong>Bronze → Silver → Gold</strong> style architecture.
</p>

<hr>

<h2>What This Project Demonstrates</h2>

<ul>
  <li>Translating API-driven JSON data into relational analytics models</li>
  <li>Refactoring standalone SQL into modular dbt models</li>
  <li>Applying consistent naming, testing, and documentation standards</li>
  <li>Modelling both product usage and marketing engagement data within a single analytics project</li>
</ul>

<hr>

<h2>Relationship to Prior SQL Work</h2>

<p>
Some models in this project are <strong>dbt refactors of earlier standalone SQL scripts</strong>, adapted to:
</p>

<ul>
  <li>Improve maintainability</li>
  <li>Enable testing and documentation</li>
  <li>Provide clearer lineage and dependencies</li>
</ul>

<p>
The aim is to show how exploratory or one-off SQL evolves into a production-ready analytics layer.
</p>

<hr>

<h2>Notes</h2>

<ul>
  <li>This repository is <strong>not intended to be run standalone</strong>.</li>
  <li>It is a <strong>representative snapshot</strong> of a dbt Cloud project.</li>
  <li>Warehouse connections, credentials, and dbt Cloud configuration are intentionally excluded.</li>
</ul>

<hr>

<h2>Related Projects</h2>

<ul>
  <li>
    <strong>Amplitude API extraction:</strong>
    <a href="https://github.com/Jaffulee/deng3-amplitude">https://github.com/Jaffulee/deng3-amplitude</a>
  </li>
  <li>
    <strong>Mailchimp API extraction:</strong>
    <a href="https://github.com/Jaffulee/deng3-mailchimp">https://github.com/Jaffulee/deng3-mailchimp</a>
  </li>
</ul>