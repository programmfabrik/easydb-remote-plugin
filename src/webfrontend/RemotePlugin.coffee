class RemotePlugin extends CUI.Element

ez5.session_ready =>
	config = ez5.session.getBaseConfig()
	config = config.system or config # TODO: Remove this after #64076 is merged.

	for inst in config.webfrontend_remote_plugin?.instances or []
		js_url = inst.js_url
		js_loc = CUI.parseLocation(js_url)

		if not js_loc?.href
			console.warn("Unable to parse location:", js_url, inst)
		else
			scriptNode = CUI.dom.element "SCRIPT",
				src: js_loc.href
				type: "text/javascript"
				charset: "utf-8"

			console.info("RemotePlugin: Javascript:", js_loc.href)
			document.head.appendChild(scriptNode)

		css_url = inst.css_url
		css_loc = CUI.parseLocation(css_url)

		if not css_loc?.href
			console.warn("Unable to parse location:", css_url, inst)
		else
			cssNode = CUI.dom.element "LINK",
				rel: "stylesheet"
				charset: "utf-8"
				href: css_loc.href

			console.info("RemotePlugin: CSS:", css_loc.href)
			document.head.appendChild(cssNode)

	return
