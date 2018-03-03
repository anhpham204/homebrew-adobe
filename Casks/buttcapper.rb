cask 'buttcapper' do
  version '1.1'
  sha256 'ec0fdeb87ee2f2ba76d04f3965a79f7b32df021e0ab4d8fc0a208239fdb6b693'

  # dropbox.com/s/mgsiyaaz4ncnpu9 was verified as official when first introduced to the cask
  url "https://dropbox.com/s/mgsiyaaz4ncnpu9/ButtCapper_v#{version}.zip?dl=1"
  name 'ButtCapper'
  homepage 'http://battleaxe.co/buttcapper'

  folder = '/Applications/Adobe Creative Cloud/Adobe After Effects *'
  latest = Dir[folder].sort { |min, max| min <=> max }[-1]

  scripts = "#{latest}/Scripts/"
  panels = "#{scripts}ScriptUI Panels/"

  plugin = 'ButtCapper.jsxbin'
  headless = 'ButtCapper_Headless'

  artifact "ButtCapper_v#{version}/ScriptUI Panels/#{plugin}", target: panels + plugin
  artifact "ButtCapper_v#{version}/Headless", target: scripts + headless

  uninstall delete: [
                      panels + plugin,
                      scripts + headless,
                      "~/Library/Preferences/Adobe/After Effects/*/ScriptUI Panels/#{plugin}",
                      '~/Library/Application Support/BattleAxe/undefined',
                    ],
            rmdir:  '~/Library/Application Support/BattleAxe'

  caveats do
    free_license "https://gumroad.com/l/#{token}"
    'Please consider a voluntary purchase if you like this plugin.'
  end
end