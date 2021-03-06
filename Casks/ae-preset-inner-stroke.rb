cask 'ae-preset-inner-stroke' do
  version :latest
  sha256 :no_check

  preset = 'zl_InnerStroke.ffx'
  url "http://zacklovatt.com/presets/#{preset}"
  name 'Inner Stroke'
  homepage 'https://zacklovatt.com/preset-shape-layer-inner-stroke'

  container type: :naked

  folder = Dir['/Applications/Adobe Creative Cloud/Adobe After Effects */Presets'].max

  artifact preset, target: "#{folder}/#{preset}"
end
