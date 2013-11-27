# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create default user
user = User.new
password = 'aaaa'
user.email = 'a@a.com'
user.password = password
user.password_confirmation = password
if user.save
  puts "== User created with login email #{user.email} and password #{password}"
else
  puts "== ERROR :: User can't created with email #{user.email} and password #{password}"
  puts "==          Errors: #{user.errors.full_messages}"
end

# Create post example
post = Post.new
post.title = "Example of post in kramdown (sic, not Kramdown or KramDown, just kramdown) "
post.body_kd = "# Example of kramdown\r\n\r\nThis is an example of kramdown (a superset of Markdown).\r\n\r\n## Emphasis\r\n\r\n*some text in italic*\r\n\r\n_some other text  in italic_\r\n\r\n**some text in bold**\r\n\r\n__some other text in bold__\r\n\r\n## Formulas\r\nExample of inline formula: $$ \\phi(x,y) = \\phi = 5 + 5 $$\r\n\r\nThe render of formulas is the [MathJax](http://www.mathjax.org/) library.\r\n\r\nSee this formula example:\r\n$$\r\n\\frac{1}{\\Bigl(\\sqrt{\\phi \\sqrt{5}}-\\phi\\Bigr) e^{\\frac25 \\pi}} =\r\n1+\\frac{e^{-2\\pi}} {1+\\frac{e^{-4\\pi}} {1+\\frac{e^{-6\\pi}}\r\n{1+\\frac{e^{-8\\pi}} {1+\\ldots} } } }\r\n$$\r\n\r\n## Code\r\nFor render in color and more beautiful we use the [Prism](http://prismjs.com/) library\r\n\r\nThis is an example of inline code `CTRL+R`.\r\n\r\nExample of block of code and render colours with Prism:\r\n\r\n~~~ ruby\r\ndef what?\r\n  42\r\nend\r\n~~~\r\n\r\nThe same example but using custom classes, in this case the class `language-ruby` for color syntax and `line-numbers` (Prism plugin) for show line numbers\r\n\r\n~~~\r\ndef what?\r\n  42\r\nend\r\n~~~\r\n{: .language-ruby .line-numbers}\r\n\r\nOther example but this use the Line Highlight plugin for Prism:\r\n\r\n~~~\r\nfunction $$(expr, con) {\r\n\treturn Array.prototype.slice.call((con || document).querySelectorAll(expr));\r\n}\r\n    \r\nfunction highlightLines(pre, lines, classes) {\r\n\tvar ranges = lines.replace(/\\s+/g, '').split(','),\r\n\t    offset = +pre.getAttribute('data-line-offset') || 0;\r\n\t\r\n\tvar lineHeight = parseFloat(getComputedStyle(pre).lineHeight);\r\n\r\n\tfor (var i=0, range; range = ranges[i++];) {\r\n\t\trange = range.split('-');\r\n\t\t\t\t\t\r\n\t\tvar start = +range[0],\r\n\t\t    end = +range[1] || start;\r\n\t\t\r\n\t\tvar line = document.createElement('div');\r\n\t\t\r\n\t\tline.textContent = Array(end - start + 2).join(' \\r\\n');\r\n\t\tline.className = (classes || '') + ' line-highlight';\r\n\t\tline.setAttribute('data-start', start);\r\n\t\t\r\n\t\tif(end > start) {\r\n\t\t\tline.setAttribute('data-end', end);\r\n\t\t}\r\n\t\r\n\t\tline.style.top = (start - offset - 1) * lineHeight + 'px';\r\n\t\t\r\n\t\t(pre.querySelector('code') || pre).appendChild(line);\r\n\t}\r\n}\r\n~~~\r\n{: class=\"language-javascript\" data-line=\"1,3,5-10\"}\r\n\r\n\r\n"
post.status = :pending_review
if post.save
  puts "== The example post was created"
else
  puts "== ERROR :: Example of post can't created"
  puts "==          Errors: #{post.errors.full_messages}"
end