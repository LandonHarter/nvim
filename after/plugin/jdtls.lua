local jdtls = require('jdtls')

-- Determine OS
local home = os.getenv('HOME')
if vim.fn.has('win32') == 1 then
	home = os.getenv('USERPROFILE')
end

local root_markers = { '.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle' }
local root_dir = require('jdtls.setup').find_root(root_markers)

-- Workspace directory (project-specific)
local workspace_dir = vim.fn.stdpath('data') .. '/jdtls-workspace/' .. vim.fn.fnamemodify(root_dir, ':p:h:t')

local config = {
	cmd = {
		'java',
		'-Declipse.application=org.eclipse.jdt.ls.core.id1',
		'-Dosgi.bundles.defaultStartLevel=4',
		'-Declipse.product=org.eclipse.jdt.ls.core.product',
		'-Dlog.protocol=true',
		'-Dlog.level=ALL',
		'-Xmx1g',
		'--add-modules=ALL-SYSTEM',
		'--add-opens', 'java.base/java.util=ALL-UNNAMED',
		'--add-opens', 'java.base/java.lang=ALL-UNNAMED',

		'-jar', vim.fn.glob(vim.fn.stdpath('data') ..
	'/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar'),

		'-configuration', vim.fn.stdpath('data') ..
	'/mason/packages/jdtls/config_' .. (vim.fn.has('win32') == 1 and 'win' or 'linux'),

		'-data', workspace_dir,
	},

	root_dir = root_dir,

	settings = {
		java = {
		}
	},

	init_options = {
		bundles = {}
	},
}

jdtls.start_or_attach(config)
