var fs = require("fs");
var Handlebars = require("handlebars");

function render(resume) {
	var css = fs.readFileSync(__dirname + "/style.css", "utf-8");
	var template = fs.readFileSync(__dirname + "/resume.template", "utf-8");
	Handlebars.registerHelper( "yearOf", function(d){ return new Date(d).getFullYear(); })

	return Handlebars.compile(template)({
		css: css,
		resume: resume
	});
}

module.exports = {
	render: render
};
