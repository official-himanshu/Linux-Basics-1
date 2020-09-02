### What is jinja template?
Ans:- Jinja is a modern and designer-friendly templating language for Python, modelled after Django’s templates. It is fast, widely used and secure with the optional sandboxed template execution environment.

      <title>{% block title %}{% endblock %}</title>
      <ul>
      {% for user in users %}
      <li><a href="{{ user.url }}">{{ user.username }}</a></li>
      {% endfor %}
      </ul>
      
      Other text based templates are: Smarty and Django
      
      
Features:

-> sandboxed execution
-> powerful automatic HTML escaping system for XSS prevention
-> template inheritance
-> compiles down to the optimal python code just in time
-> optional ahead-of-time template compilation
-> easy to debug. Line numbers of exceptions directly point to the correct line in the template.
-> configurable synta

### What is sandboxed template execution?
Ans:- The sandboxed environment. It works like the regular environment but tells the compiler to generate sandboxed code. 
Additionally subclasses of this environment may override the methods that tell the runtime what attributes or functions are safe to access.


### Installation
You can install the most recent Jinja version using pip:

        pip install Jinja2

This will install Jinja in your Python installation’s site-packages directory.

##### MarkupSafe
MarkupSafe escapes characters so text is safe to use in HTML and XML. Characters that have special meanings are replaced so that they display as the actual characters.
This mitigates injection attacks, meaning untrusted user input can safely be displayed on a page.



