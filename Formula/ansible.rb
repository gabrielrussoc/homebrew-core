class Ansible < Formula
  include Language::Python::Virtualenv

  desc "Automate deployment, configuration, and upgrading"
  homepage "https://www.ansible.com/"
  url "https://releases.ansible.com/ansible/ansible-2.3.2.0.tar.gz"
  sha256 "0563b425279422487f12616ef719f6e558373b258dcf47e548d119be8d3168eb"
  revision 1
  head "https://github.com/ansible/ansible.git", :branch => "devel"

  bottle do
    cellar :any
    sha256 "bf12b40eacbec33b6940554e39c71cfd79b84a65d90705173dd2bbad64be7f9d" => :sierra
    sha256 "5e2e00d895b4461a60b1d330887e5ef29a58995e59854848cf1eb891825f2d3d" => :el_capitan
    sha256 "c946517cffc191e22b48d4074f4d151ccd2c405b35b5b7ac9fd118f96f5a5579" => :yosemite
  end

  depends_on "pkg-config" => :build
  depends_on :python
  depends_on "libyaml"
  depends_on "openssl@1.1"

  # Collect requirements from:
  #   ansible
  #   docker-py
  #   python-neutronclient (OpenStack)
  #   shade (OpenStack)
  #   pywinrm (Windows)
  #   kerberos (Windows)
  #   xmltodict (Windows)
  #   boto (AWS)
  #   boto3 (AWS)
  #   botocore (AWS)
  #   apache-libcloud (Google GCE)
  #   python-keyczar (Accelerated Mode)
  #   passlib (htpasswd core module)
  #   zabbix-api (Zabbix extras module)
  #   junos-eznc (Juniper device support)
  #   jxmlease (Juniper device support)
  #   dnspython (DNS Lookup - dig)

  ### setup_requires dependencies
  resource "pbr" do
    url "https://files.pythonhosted.org/packages/d5/d6/f2bf137d71e4f213b575faa9eb426a8775732432edb67588a8ee836ecb80/pbr-3.1.1.tar.gz"
    sha256 "05f61c71aaefc02d8e37c0a3eeb9815ff526ea28b3b76324769e6158d7f95be1"
  end

  resource "pytz" do
    url "https://files.pythonhosted.org/packages/a4/09/c47e57fc9c7062b4e83b075d418800d322caa87ec0ac21e6308bd3a2d519/pytz-2017.2.zip"
    sha256 "f5c056e8f62d45ba8215e5cb8f50dfccb198b4b9fbea8500674f3443e4689589"
  end
  ### end

  ### extras for requests[security]
  resource "pyOpenSSL" do
    url "https://files.pythonhosted.org/packages/b0/9e/7088f6165c40c46416aff434eb806c1d64ad6ec6dbc201f5ad4d0484704e/pyOpenSSL-17.2.0.tar.gz"
    sha256 "5d617ce36b07c51f330aa63b83bf7f25c40a0e95958876d54d1982f8c91b4834"
  end

  resource "ndg-httpsclient" do
    url "https://files.pythonhosted.org/packages/a2/a7/ad1c1c48e35dc7545dab1a9c5513f49d5fa3b5015627200d2be27576c2a0/ndg_httpsclient-0.4.2.tar.gz"
    sha256 "580987ef194334c50389e0d7de885fccf15605c13c6eecaabd8d6c43768eb8ac"
  end
  ### end

  # The rest of this list should always be sorted by:
  # pip install homebrew-pypi-poet && poet_lint $(brew formula ansible)
  resource "Babel" do
    url "https://files.pythonhosted.org/packages/3a/cb/46b76381ebda237c1b08d1c94394659679a4f1bd6475fe3703b303830ee0/Babel-2.5.0.tar.gz"
    sha256 "754177ee7481b6fac1bf84edeeb6338ab51640984e97e4083657d384b1c8830d"
  end

  # Use < 2.9 until https://github.com/ansible/ansible/issues/23779 is resolved
  resource "Jinja2" do
    url "https://files.pythonhosted.org/packages/5f/bd/5815d4d925a2b8cbbb4b4960f018441b0c65f24ba29f3bdcfb3c8218a307/Jinja2-2.8.1.tar.gz"
    sha256 "35341f3a97b46327b3ef1eb624aadea87a535b8f50863036e085e7c426ac5891"
  end

  resource "MarkupSafe" do
    url "https://files.pythonhosted.org/packages/4d/de/32d741db316d8fdb7680822dd37001ef7a448255de9699ab4bfcbdf4172b/MarkupSafe-1.0.tar.gz"
    sha256 "a6be69091dac236ea9c6bc7d012beab42010fa914c459791d627dad4910eb665"
  end

  resource "PrettyTable" do
    url "https://files.pythonhosted.org/packages/ef/30/4b0746848746ed5941f052479e7c23d2b56d174b82f4fd34a25e389831f5/prettytable-0.7.2.tar.bz2"
    sha256 "853c116513625c738dc3ce1aee148b5b5757a86727e67eff6502c7ca59d43c36"
  end

  resource "PyNaCl" do
    url "https://files.pythonhosted.org/packages/8d/f3/02605b056e465bf162508c4d1635a2bccd9abd1ee3ed2a1bb4e9676eac33/PyNaCl-1.1.2.tar.gz"
    sha256 "32f52b754abf07c319c04ce16905109cab44b0e7f7c79497431d3b2000f8af8c"
  end

  resource "PyYAML" do
    url "https://files.pythonhosted.org/packages/4a/85/db5a2df477072b2902b0eb892feb37d88ac635d36245a72a6a69b23b383a/PyYAML-3.12.tar.gz"
    sha256 "592766c6303207a20efc445587778322d7f73b161bd994f227adaa341ba212ab"
  end

  resource "apache-libcloud" do
    url "https://files.pythonhosted.org/packages/a8/17/87d42df2558518bc17ba33de876e2ce12bc94dd785e0ccb75f8ffe81142b/apache-libcloud-2.1.0.tar.gz"
    sha256 "7e812f730495e5d59d0adb06792115241f08a59566d25445613b15f008c73a05"
  end

  resource "appdirs" do
    url "https://files.pythonhosted.org/packages/48/69/d87c60746b393309ca30761f8e2b49473d43450b150cb08f3c6df5c11be5/appdirs-1.4.3.tar.gz"
    sha256 "9e5896d1372858f8dd3344faf4e5014d21849c756c8d5701f78f8a103b372d92"
  end

  resource "asn1crypto" do
    url "https://files.pythonhosted.org/packages/67/14/5d66588868c4304f804ebaff9397255f6ec5559e46724c2496e0f26e68d6/asn1crypto-0.22.0.tar.gz"
    sha256 "cbbadd640d3165ab24b06ef25d1dca09a3441611ac15f6a6b452474fdf0aed1a"
  end

  resource "backports.ssl_match_hostname" do
    url "https://files.pythonhosted.org/packages/76/21/2dc61178a2038a5cb35d14b61467c6ac632791ed05131dda72c20e7b9e23/backports.ssl_match_hostname-3.5.0.1.tar.gz"
    sha256 "502ad98707319f4a51fa2ca1c677bd659008d27ded9f6380c79e8932e38dcdf2"
  end

  resource "bcrypt" do
    url "https://files.pythonhosted.org/packages/58/e9/6d7f1d883d8c5876470b5d187d72c04f2a9954d61e71e7eb5d2ea2a50442/bcrypt-3.1.3.tar.gz"
    sha256 "6645c8d0ad845308de3eb9be98b6fd22a46ec5412bfc664a423e411cdd8f5488"
  end

  resource "boto" do
    url "https://files.pythonhosted.org/packages/66/e7/fe1db6a5ed53831b53b8a6695a8f134a58833cadb5f2740802bc3730ac15/boto-2.48.0.tar.gz"
    sha256 "deb8925b734b109679e3de65856018996338758f4b916ff4fe7bb62b6d7000d1"
  end

  resource "boto3" do
    url "https://files.pythonhosted.org/packages/53/c6/06b4fc6f371434fde4a0a9741b020910196eb37cf144084933b6574856c7/boto3-1.4.6.tar.gz"
    sha256 "6befc73f61a8b62b387847f3f5e7c3234d36a44e2a22e975054eb431d6de9561"
  end

  resource "botocore" do
    url "https://files.pythonhosted.org/packages/9d/8f/41502357cf2b665c58a52124deb956bc962fc004c4b5ae0d1d02f7ee7008/botocore-1.6.6.tar.gz"
    sha256 "af69419c66a29d36b5f3cac329771159138e79800ab8e104e44b808f5363bd1e"
  end

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/20/d0/3f7a84b0c5b89e94abbd073a5f00c7176089f526edb056686751d5064cbd/certifi-2017.7.27.1.tar.gz"
    sha256 "40523d2efb60523e113b44602298f0960e900388cf3bb6043f645cf57ea9e3f5"
  end

  resource "cffi" do
    url "https://files.pythonhosted.org/packages/5b/b9/790f8eafcdab455bcd3bd908161f802c9ce5adbf702a83aa7712fcc345b7/cffi-1.10.0.tar.gz"
    sha256 "b3b02911eb1f6ada203b0763ba924234629b51586f72a21faacc638269f4ced5"
  end

  resource "chardet" do
    url "https://files.pythonhosted.org/packages/fc/bb/a5768c230f9ddb03acc9ef3f0d4a3cf93462473795d18e9535498c8f929d/chardet-3.0.4.tar.gz"
    sha256 "84ab92ed1c4d4f16916e05906b6b75a6c0fb5db821cc65e70cbd64a3e2a5eaae"
  end

  resource "cliff" do
    url "https://files.pythonhosted.org/packages/9e/26/7db86b6fb7bcf335e691a274b8f5141006ea87e7783e43d7ef5a498a09da/cliff-2.8.0.tar.gz"
    sha256 "a4fd35b3d98f5f806b6f38c97559ad671376f7d54d1e29015dbd6d805a13ff46"
  end

  resource "cmd2" do
    url "https://files.pythonhosted.org/packages/e6/34/118c4d669fa704732d22344b6a014922c552b794317f6f048012455cbdfe/cmd2-0.7.6.tar.gz"
    sha256 "fcf116b44a46188bbae2ba852a5c2354c069b798feda314a452cb927054d2f86"
  end

  resource "cryptography" do
    url "https://files.pythonhosted.org/packages/9c/1a/0fc8cffb04582f9ffca61b15b0681cf2e8588438e55f61403eb9880bd8e0/cryptography-2.0.3.tar.gz"
    sha256 "d04bb2425086c3fe86f7bc48915290b13e798497839fbb18ab7f6dffcf98cc3a"
  end

  resource "debtcollector" do
    url "https://files.pythonhosted.org/packages/03/53/55f00f682f3e692a85be2bf4e227a77f67f6e504d9f505e0423590bdefa6/debtcollector-1.17.0.tar.gz"
    sha256 "71e3350b6b97acede200f30b3858749b21303a70fde4ded26e4cbe599a3b0466"
  end

  resource "decorator" do
    url "https://files.pythonhosted.org/packages/bb/e0/f6e41e9091e130bf16d4437dabbac3993908e4d6485ecbc985ef1352db94/decorator-4.1.2.tar.gz"
    sha256 "7cb64d38cb8002971710c8899fbdfb859a23a364b7c99dab19d1f719c2ba16b5"
  end

  resource "deprecation" do
    url "https://files.pythonhosted.org/packages/8c/e3/e5c66eba8fa2fd567065fa70ada98b990f449f74fb812b408fa7aafe82c9/deprecation-1.0.1.tar.gz"
    sha256 "b9bff5cc91f601ef2a8a0200bc6cde3f18a48c2ed3d1ecbfc16076b14b3ad935"
  end

  resource "dnspython" do
    url "https://files.pythonhosted.org/packages/e4/96/a598fa35f8a625bc39fed50cdbe3fd8a52ef215ef8475c17cabade6656cb/dnspython-1.15.0.zip"
    sha256 "40f563e1f7a7b80dc5a4e76ad75c23da53d62f1e15e6e517293b04e1f84ead7c"
  end

  resource "docker-py" do
    url "https://files.pythonhosted.org/packages/fa/2d/906afc44a833901fc6fed1a89c228e5c88fbfc6bd2f3d2f0497fdfb9c525/docker-py-1.10.6.tar.gz"
    sha256 "4c2a75875764d38d67f87bc7d03f7443a3895704efc57962bdf6500b8d4bc415"
  end

  resource "docker-pycreds" do
    url "https://files.pythonhosted.org/packages/95/2e/3c99b8707a397153bc78870eb140c580628d7897276960da25d8a83c4719/docker-pycreds-0.2.1.tar.gz"
    sha256 "93833a2cf280b7d8abbe1b8121530413250c6cd4ffed2c1cf085f335262f7348"
  end

  resource "docutils" do
    url "https://files.pythonhosted.org/packages/84/f4/5771e41fdf52aabebbadecc9381d11dea0fa34e4759b4071244fa094804c/docutils-0.14.tar.gz"
    sha256 "51e64ef2ebfb29cae1faa133b3710143496eca21c530f3f71424d77687764274"
  end

  resource "dogpile.cache" do
    url "https://files.pythonhosted.org/packages/b6/3d/35c05ca01c070bb70d9d422f2c4858ecb021b05b21af438fec5ccd7b945c/dogpile.cache-0.6.4.tar.gz"
    sha256 "a73aa3049cd88d7ec57a1c2e8946abdf4f14188d429c1023943fcc55c4568da1"
  end

  resource "enum34" do
    url "https://files.pythonhosted.org/packages/bf/3e/31d502c25302814a7c2f1d3959d2a3b3f78e509002ba91aea64993936876/enum34-1.1.6.tar.gz"
    sha256 "8ad8c4783bf61ded74527bffb48ed9b54166685e4230386a9ed9b1279e2df5b1"
  end

  resource "funcsigs" do
    url "https://files.pythonhosted.org/packages/94/4a/db842e7a0545de1cdb0439bb80e6e42dfe82aaeaadd4072f2263a4fbed23/funcsigs-1.0.2.tar.gz"
    sha256 "a7bb0f2cf3a3fd1ab2732cb49eba4252c2af4240442415b4abce3b87022a8f50"
  end

  resource "functools32" do
    url "https://files.pythonhosted.org/packages/c5/60/6ac26ad05857c601308d8fb9e87fa36d0ebf889423f47c3502ef034365db/functools32-3.2.3-2.tar.gz"
    sha256 "f6253dfbe0538ad2e387bd8fdfd9293c925d63553f5813c4e587745416501e6d"
  end

  resource "futures" do
    url "https://files.pythonhosted.org/packages/cc/26/b61e3a4eb50653e8a7339d84eeaa46d1e93b92951978873c220ae64d0733/futures-3.1.1.tar.gz"
    sha256 "51ecb45f0add83c806c68e4b06106f90db260585b25ef2abfcda0bd95c0132fd"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/f4/bd/0467d62790828c23c47fc1dfa1b1f052b24efdf5290f071c7a91d0d82fd3/idna-2.6.tar.gz"
    sha256 "2c6a5de3089009e3da7c5dde64a141dbc8551d5b7f6cf4ed7c2568d0cc520a8f"
  end

  resource "ipaddress" do
    url "https://files.pythonhosted.org/packages/4e/13/774faf38b445d0b3a844b65747175b2e0500164b7c28d78e34987a5bfe06/ipaddress-1.0.18.tar.gz"
    sha256 "5d8534c8e185f2d8a1fda1ef73f2c8f4b23264e8e30063feeb9511d492a413e1"
  end

  resource "iso8601" do
    url "https://files.pythonhosted.org/packages/45/13/3db24895497345fb44c4248c08b16da34a9eb02643cea2754b21b5ed08b0/iso8601-0.1.12.tar.gz"
    sha256 "49c4b20e1f38aa5cf109ddcd39647ac419f928512c869dc01d5c7098eddede82"
  end

  resource "jmespath" do
    url "https://files.pythonhosted.org/packages/e5/21/795b7549397735e911b032f255cff5fb0de58f96da794274660bca4f58ef/jmespath-0.9.3.tar.gz"
    sha256 "6a81d4c9aa62caf061cb517b4d9ad1dd300374cd4706997aff9cd6aedd61fc64"
  end

  resource "jsonpatch" do
    url "https://files.pythonhosted.org/packages/36/de/499bea7aac917f86eb5be148f631c3ddced4e60c8d119d63939c53a5ab5b/jsonpatch-1.16.tar.gz"
    sha256 "f025c28a08ce747429ee746bb21796c3b6417ec82288f8fe6514db7398f2af8a"
  end

  resource "jsonpointer" do
    url "https://files.pythonhosted.org/packages/f6/36/6bdd302303e8bc7c25102dbc1eabb3e3d97f57b0f8f414f4da7ea7ab9dd8/jsonpointer-1.10.tar.gz"
    sha256 "9fa5dcac35eefd53e25d6cd4c310d963c9f0b897641772cd6e5e7b89df7ee0b1"
  end

  resource "jsonschema" do
    url "https://files.pythonhosted.org/packages/58/b9/171dbb07e18c6346090a37f03c7e74410a1a56123f847efed59af260a298/jsonschema-2.6.0.tar.gz"
    sha256 "6ff5f3180870836cae40f06fa10419f557208175f13ad7bc26caa77beb1f6e02"
  end

  resource "junos-eznc" do
    url "https://files.pythonhosted.org/packages/31/e2/5f31a88e3fa4caadbc6fb921bf83dfa829de810128f167b1394fbf7bff68/junos-eznc-2.1.5.tar.gz"
    sha256 "c8ed64262c7813473bfdc3f9a40d70f82e3ecb056556fea552fa04a7b8570a4c"
  end

  resource "jxmlease" do
    url "https://files.pythonhosted.org/packages/80/b3/a1ffc5ea763c84780a9acfaa4f69a98f6c974eaf297e20d9d3648ef7d95b/jxmlease-1.0.1.tar.gz"
    sha256 "fb04cfd54d8d7e4cc533108750047e9ccf43139c3c0220f8a082274b19564e98"
  end

  resource "kerberos" do
    url "https://files.pythonhosted.org/packages/46/73/1e7520780a50c9470aeba2b3c020981201c8662b618fb2889a3e3dc2aeed/kerberos-1.2.5.tar.gz"
    sha256 "b32ae66b1da2938a2ae68f83d67ce41b5c5e3b6c731407104cd209ba426dadfe"
  end

  resource "keystoneauth1" do
    url "https://files.pythonhosted.org/packages/60/84/563732a068310ee9a8c3626a037efea22b3a926431d91f1ec991db89a70e/keystoneauth1-3.1.0.tar.gz"
    sha256 "e5abfa8bbe866d52ca56afbe528d15214a60033cc1dc9804478cae7424f0f8fb"
  end

  resource "lxml" do
    url "https://files.pythonhosted.org/packages/20/b3/9f245de14b7696e2d2a386c0b09032a2ff6625270761d6543827e667d8de/lxml-3.8.0.tar.gz"
    sha256 "736f72be15caad8116891eb6aa4a078b590d231fdc63818c40c21624ac71db96"
  end

  resource "monotonic" do
    url "https://files.pythonhosted.org/packages/96/b3/3e9fa0bdf132a971571cbf0e3f0c8b38834f4f7af8ca9523794f4f5895e0/monotonic-1.3.tar.gz"
    sha256 "2b469e2d7dd403f7f7f79227fe5ad551ee1e76f8bb300ae935209884b93c7c1b"
  end

  resource "msgpack-python" do
    url "https://files.pythonhosted.org/packages/21/27/8a1d82041c7a2a51fcc73675875a5f9ea06c2663e02fcfeb708be1d081a0/msgpack-python-0.4.8.tar.gz"
    sha256 "1a2b19df0f03519ec7f19f826afb935b202d8979b0856c6fb3dc28955799f886"
  end

  resource "munch" do
    url "https://files.pythonhosted.org/packages/92/58/c17cf679a2b9b65541cc71ba13a950289b7d34dd0967e34b8816a4d87044/munch-2.2.0.tar.gz"
    sha256 "62fb4fb318e965a464b088e6af52a63e0905a50500b770596a939d3855e7aa15"
  end

  resource "ncclient" do
    url "https://files.pythonhosted.org/packages/e9/cf/cb131bcaf9b31f8d9d1b9ec3aa9a861dd72a7269a9ff07217b60157fa526/ncclient-0.5.3.tar.gz"
    sha256 "fe6b9c16ed5f1b21f5591da74bfdd91a9bdf69eb4e918f1c06b3c8db307bd32b"
  end

  resource "netaddr" do
    url "https://files.pythonhosted.org/packages/0c/13/7cbb180b52201c07c796243eeff4c256b053656da5cfe3916c3f5b57b3a0/netaddr-0.7.19.tar.gz"
    sha256 "38aeec7cdd035081d3a4c306394b19d677623bf76fa0913f6695127c7753aefd"
  end

  resource "netifaces" do
    url "https://files.pythonhosted.org/packages/72/01/ba076082628901bca750bf53b322a8ff10c1d757dc29196a8e6082711c9d/netifaces-0.10.6.tar.gz"
    sha256 "0c4da523f36d36f1ef92ee183f2512f3ceb9a9d2a45f7d19cda5a42c6689ebe0"
  end

  resource "ntlm-auth" do
    url "https://files.pythonhosted.org/packages/36/75/9f1a15858fe3047822deacfb298e9a7b932cfa760f620c60af5aab44343a/ntlm-auth-1.0.5.tar.gz"
    sha256 "ae20b5050169410a6a2225c3db8b7e4771165bb35f95f6f64c24ec935e8c9fdf"
  end

  resource "openstacksdk" do
    url "https://files.pythonhosted.org/packages/5e/3e/4872d06e712e474573d4cfd76ea79062e4c438011e17663e9525033d48f6/openstacksdk-0.9.17.tar.gz"
    sha256 "992b862df2e13a164055e009694c70c1d6f13cf283768a1b8ef509409d67846a"
  end

  resource "ordereddict" do
    url "https://files.pythonhosted.org/packages/53/25/ef88e8e45db141faa9598fbf7ad0062df8f50f881a36ed6a0073e1572126/ordereddict-1.1.tar.gz"
    sha256 "1c35b4ac206cef2d24816c89f89cf289dd3d38cf7c449bb3fab7bf6d43f01b1f"
  end

  resource "os-client-config" do
    url "https://files.pythonhosted.org/packages/84/18/7a950c23631fccd09aa33832df52b7bfce2cf2ea104959a14c04512b19db/os-client-config-1.28.0.tar.gz"
    sha256 "e5be9cfa7a57fe838255236fe4956a91ccb461548883c7b01b37b7b4081af8b8"
  end

  resource "osc-lib" do
    url "https://files.pythonhosted.org/packages/a1/2b/12e065299d6d4dc5279476e9df056cc218715bf9e5261c3c24716f3190d5/osc-lib-1.7.0.tar.gz"
    sha256 "7dee72f13e5478f8d3d836267fa019b99ed4d5e478fc08bbcc9e23029d11ec78"
  end

  resource "oslo.config" do
    url "https://files.pythonhosted.org/packages/ff/86/51b3b2a094129fc70723d64d0784b4a6e5f4be97749e314ec394d2e8ec26/oslo.config-4.11.0.tar.gz"
    sha256 "1be8aaba466a3449fdb21ee8f7025b0d3d252c8c7568b8d5d05ceff58617cd05"
  end

  resource "oslo.i18n" do
    url "https://files.pythonhosted.org/packages/37/6b/1a9ff9451a1de4b9b140d05b0bf7db2fa551d099aaa7a630e26c41806d68/oslo.i18n-3.17.0.tar.gz"
    sha256 "168b8c06f03599ac8172eb87112b5054e46bf421db03c367c059e3110d98ad31"
  end

  resource "oslo.serialization" do
    url "https://files.pythonhosted.org/packages/e6/e8/00de1a1786b397ec82c971a0c650b8961d6d2011332b05edad7323128b19/oslo.serialization-2.20.0.tar.gz"
    sha256 "fca6fbb350d560aab8a4fdc9a1128dac3b1d38b2fc9bf5ad22136ae090854802"
  end

  resource "oslo.utils" do
    url "https://files.pythonhosted.org/packages/19/ea/3743c0405e50d9d18ac57c74830526a18474a7024d4d677c2580983769ea/oslo.utils-3.28.0.tar.gz"
    sha256 "46abd731d8cfdb682eb5b1d22a2da3c549d79f889bd3db998eac4b64a955769f"
  end

  resource "paramiko" do
    url "https://files.pythonhosted.org/packages/d1/0b/c8bc96c79bbda0bcc9f2912389fa59789bb8e7e161f24b01082b4c3f948d/paramiko-2.2.1.tar.gz"
    sha256 "ff94ae65379914ec3c960de731381f49092057b6dd1d24d18842ead5a2eb2277"
  end

  resource "passlib" do
    url "https://files.pythonhosted.org/packages/25/4b/6fbfc66aabb3017cd8c3bd97b37f769d7503ead2899bf76e570eb91270de/passlib-1.7.1.tar.gz"
    sha256 "3d948f64138c25633613f303bcc471126eae67c04d5e3f6b7b8ce6242f8653e0"
  end

  resource "positional" do
    url "https://files.pythonhosted.org/packages/24/7e/3b1450db76eb48a54ea661a43ae00950275e11840042c5217bd3b47b478e/positional-1.2.1.tar.gz"
    sha256 "cf48ea169f6c39486d5efa0ce7126a97bed979a52af6261cf255a41f9a74453a"
  end

  resource "pyasn1" do
    url "https://files.pythonhosted.org/packages/17/a2/266818077dbd002d53ebe5aaaa05a04786256cea8dba1899ac0b832ef028/pyasn1-0.3.2.tar.gz"
    sha256 "90bd82e0db59d4319eaf01c2549b34c817d645275fce9ad41bac7429aa380690"
  end

  resource "pycparser" do
    url "https://files.pythonhosted.org/packages/8c/2d/aad7f16146f4197a11f8e91fb81df177adcc2073d36a17b1491fd09df6ed/pycparser-2.18.tar.gz"
    sha256 "99a8ca03e29851d96616ad0404b4aad7d9ee16f25c9f9708a11faf2810f7b226"
  end

  resource "pycrypto" do
    url "https://files.pythonhosted.org/packages/60/db/645aa9af249f059cc3a368b118de33889219e0362141e75d4eaf6f80f163/pycrypto-2.6.1.tar.gz"
    sha256 "f2ce1e989b272cfcb677616763e0a2e7ec659effa67a88aa92b3a65528f60a3c"
  end

  resource "pyparsing" do
    url "https://files.pythonhosted.org/packages/3c/ec/a94f8cf7274ea60b5413df054f82a8980523efd712ec55a59e7c3357cf7c/pyparsing-2.2.0.tar.gz"
    sha256 "0832bcf47acd283788593e7a0f542407bd9550a55a8a8435214a1960e04bcb04"
  end

  resource "pyperclip" do
    url "https://files.pythonhosted.org/packages/7b/a5/48eaa1f2d77f900679e9759d2c9ab44895e66e9612f7f6b5333273b68f29/pyperclip-1.5.27.zip"
    sha256 "a3cb6df5d8f1557ca8fc514d94fabf50dc5a97042c90e5ba4f3611864fed3fc5"
  end

  resource "pyserial" do
    url "https://files.pythonhosted.org/packages/cc/74/11b04703ec416717b247d789103277269d567db575d2fd88f25d9767fe3d/pyserial-3.4.tar.gz"
    sha256 "6e2d401fdee0eab996cf734e67773a0143b932772ca8b42451440cfed942c627"
  end

  resource "python-cinderclient" do
    url "https://files.pythonhosted.org/packages/82/78/fda6bfdf95b6ea889ec4a39cbd29319bb1fad9cdb98fb370a5e89cb6fd01/python-cinderclient-3.1.0.tar.gz"
    sha256 "b1a304291e2b3125a62211ea5adefe7ab35ddd5229f813154fc8cd2ef80f3607"
  end

  resource "python-dateutil" do
    url "https://files.pythonhosted.org/packages/54/bb/f1db86504f7a49e1d9b9301531181b00a1c7325dc85a29160ee3eaa73a54/python-dateutil-2.6.1.tar.gz"
    sha256 "891c38b2a02f5bb1be3e4793866c8df49c7d19baabf9c1bad62547e0b4866aca"
  end

  resource "python-glanceclient" do
    url "https://files.pythonhosted.org/packages/3f/eb/77366b3c5a568b1a205fb3916488219ab6f44d129c455b349642ac5ecf11/python-glanceclient-2.8.0.tar.gz"
    sha256 "26795c19d9b5a2ec54dfc023f5ea869f8b8ae772669606b4af9125a2db51a813"
  end

  resource "python-ironicclient" do
    url "https://files.pythonhosted.org/packages/6e/b4/000ba45dc5ad7911be037c91c1ee6a0baacada58a9b357d81bd10610eab8/python-ironicclient-1.16.0.tar.gz"
    sha256 "cab1dbc0d10d2a5b82e43f3cc2a7cc9d85e5b79eb2416ef8247ae7162c98dbf3"
  end

  resource "python-keyczar" do
    url "https://files.pythonhosted.org/packages/c8/14/3ffb68671fef927fa5b60f21c43a04a4a007acbe939a26ba08b197fea6b3/python-keyczar-0.716.tar.gz"
    sha256 "f9b614112dc8248af3d03b989da4aeca70e747d32fe7e6fce9512945365e3f83"
  end

  resource "python-keystoneclient" do
    url "https://files.pythonhosted.org/packages/a4/a8/b8a83375ee028a0bd28acfcbb9bba20ab27ae2e7e513553e0bc1b901a4e4/python-keystoneclient-3.13.0.tar.gz"
    sha256 "f897eaa6b251a12e5d23130e8435fb5d2ead6f7ea1d1d20faf2ccc1c76c51c90"
  end

  resource "python-neutronclient" do
    url "https://files.pythonhosted.org/packages/36/01/62c0a5b7b96b3c8a22fc758cf90d8e0798790dfce5e32380587ea499bca9/python-neutronclient-6.5.0.tar.gz"
    sha256 "4cdb6b2603c7c9324dfb05d4b75d5467fcfac05c560b1b15afced63d285bb60c"
  end

  resource "python-novaclient" do
    url "https://files.pythonhosted.org/packages/63/28/ba067a0c726bac8d64b16741f9c5f5b5f15d9e81ad8642dcf41339cdee26/python-novaclient-9.1.0.tar.gz"
    sha256 "0666571b72cd7a056187795c274838d1b0d2f0d80ef2f1c8ca6924e49660375c"
  end

  resource "python-openstackclient" do
    url "https://files.pythonhosted.org/packages/e1/a6/25eb5bbb1064bd4203771fd504a717341fcd7d5c7fb9d91beab966d41191/python-openstackclient-3.12.0.tar.gz"
    sha256 "e74e1561dc0ca9aa2193d3e4968f13fba1726deff3ec026eba319fe706d11950"
  end

  resource "pywinrm" do
    url "https://files.pythonhosted.org/packages/0b/ca/d0ed22845185fdceb24a1e13811a993e805df9a147d223311061d2e294a7/pywinrm-0.2.2.tar.gz"
    sha256 "3030f700fbd6d06f715d4374c10b3586624bccca003b7075dd281c875705ac1b"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/b0/e1/eab4fc3752e3d240468a8c0b284607899d2fbfb236a56b7377a329aa8d09/requests-2.18.4.tar.gz"
    sha256 "9c443e7324ba5b85070c4a818ade28bfabedf16ea10206da1132edaa6dda237e"
  end

  resource "requests_ntlm" do
    url "https://files.pythonhosted.org/packages/e8/96/e1a02118867a47f7618df891e5fbecd7e50cafb30b42f1429a2ed5d268ce/requests_ntlm-1.0.0.tar.gz"
    sha256 "53ca319f5538e18c38ac79ec4e0d9680bd8ea7ac05532ed8316879296e426641"
  end

  resource "requestsexceptions" do
    url "https://files.pythonhosted.org/packages/86/36/e8e639fc915ac199f98adfe2bcb8f1bf438681d9020660824b373de0c141/requestsexceptions-1.3.0.tar.gz"
    sha256 "8f141ba636d6748cd29208c1955bde38bf00fcdda1a685bc09d8ed133700353e"
  end

  resource "rfc3986" do
    url "https://files.pythonhosted.org/packages/4b/f6/8f0a24e50454494b0736fe02e6617e7436f2b30148b8f062462177e2ca2d/rfc3986-1.1.0.tar.gz"
    sha256 "8458571c4c57e1cf23593ad860bb601b6a604df6217f829c2bc70dc4b5af941b"
  end

  resource "s3transfer" do
    url "https://files.pythonhosted.org/packages/8b/13/517e8ec7c13f0bb002be33fbf53c4e3198c55bb03148827d72064426fe6e/s3transfer-0.1.10.tar.gz"
    sha256 "ba1a9104939b7c0331dc4dd234d79afeed8b66edce77bbeeecd4f56de74a0fc1"
  end

  resource "scp" do
    url "https://files.pythonhosted.org/packages/1d/a9/618f1e40e30c69ffab668493953e74e6c266f383af6e34e1b8f089e41139/scp-0.10.2.tar.gz"
    sha256 "18f59e48df67fac0b069591609a0f4d50d781a101ddb8ec705f0c2e3501a8386"
  end

  resource "shade" do
    url "https://files.pythonhosted.org/packages/83/c7/b83ce36d82a98c2a734dc6faf6ad4274f90746ddf50e8baefb2f654d8fcd/shade-1.22.2.tar.gz"
    sha256 "66b1077fd08715f892e1db0ea8d672260634c9ca72440fa184831f7c096e16da"
  end

  resource "simplejson" do
    url "https://files.pythonhosted.org/packages/08/48/c97b668d6da7d7bebe7ea1817a6f76394b0ec959cb04214ca833c34359df/simplejson-3.11.1.tar.gz"
    sha256 "01a22d49ddd9a168b136f26cac87d9a335660ce07aa5c630b8e3607d6f4325e7"
  end

  resource "six" do
    url "https://files.pythonhosted.org/packages/b3/b2/238e2590826bfdd113244a40d9d3eb26918bd798fc187e2360a8367068db/six-1.10.0.tar.gz"
    sha256 "105f8d68616f8248e24bf0e9372ef04d3cc10104f1980f54d57b2ce73a5ad56a"
  end

  resource "stevedore" do
    url "https://files.pythonhosted.org/packages/08/58/e21f4691e8e75a290bdbfa366f06b9403c653642ef31f879e07f6f9ad7db/stevedore-1.25.0.tar.gz"
    sha256 "c8a373b90487b7a1b52ebaa3ca5059315bf68d9ebe15b2203c2fa675bd7e1e7e"
  end

  resource "unicodecsv" do
    url "https://files.pythonhosted.org/packages/6f/a4/691ab63b17505a26096608cc309960b5a6bdf39e4ba1a793d5f9b1a53270/unicodecsv-0.14.1.tar.gz"
    sha256 "018c08037d48649a0412063ff4eda26eaa81eff1546dbffa51fa5293276ff7fc"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/ee/11/7c59620aceedcc1ef65e156cc5ce5a24ef87be4107c2b74458464e437a5d/urllib3-1.22.tar.gz"
    sha256 "cc44da8e1145637334317feebd728bd869a35285b93cbb4cca2577da7e62db4f"
  end

  resource "warlock" do
    url "https://files.pythonhosted.org/packages/0f/d4/408b936a3d9214b7685c35936bb59d9254c70ff319ee6a837b9efcf5615e/warlock-1.2.0.tar.gz"
    sha256 "7c0d17891e14cf77e13a598edecc9f4682a5bc8a219dc84c139c5ba02789ef5a"
  end

  resource "websocket-client" do
    url "https://files.pythonhosted.org/packages/06/19/f00725a8aee30163a7f257092e356388443034877c101757c1466e591bf8/websocket_client-0.44.0.tar.gz"
    sha256 "15f585566e2ea7459136a632b9785aa081093064391878a448c382415e948d72"
  end

  resource "wrapt" do
    url "https://files.pythonhosted.org/packages/a0/47/66897906448185fcb77fc3c2b1bc20ed0ecca81a0f2f88eda3fc5a34fc3d/wrapt-1.10.11.tar.gz"
    sha256 "d4d560d479f2c21e1b5443bbd15fe7ec4b37fe7e53d335d3b9b0a7b1226fe3c6"
  end

  resource "xmltodict" do
    url "https://files.pythonhosted.org/packages/57/17/a6acddc5f5993ea6eaf792b2e6c3be55e3e11f3b85206c818572585f61e1/xmltodict-0.11.0.tar.gz"
    sha256 "8f8d7d40aa28d83f4109a7e8aa86e67a4df202d9538be40c0cb1d70da527b0df"
  end

  resource "zabbix-api" do
    url "https://files.pythonhosted.org/packages/39/d9/6f31d35a8721364f1a3ac07dfe6f1bec4839c910a8b1dc14c9206e425d3c/zabbix-api-0.4.tar.gz"
    sha256 "31fab8ca9b12aa5e6fe79b4463cfe62f33ded770ddc933a8d99c4debe934a0de"
  end

  def install
    # https://github.com/Homebrew/homebrew-core/issues/7197
    ENV.prepend "CPPFLAGS", "-I#{MacOS.sdk_path}/usr/include/ffi"

    inreplace "lib/ansible/constants.py" do |s|
      s.gsub! "/usr/share/ansible", pkgshare
      s.gsub! "/etc/ansible", etc/"ansible"
    end

    virtualenv_install_with_resources

    # prettytable 0.7.2 has file permissions 600 for some files.
    # We need to add read permissions in order to be able to use it as a
    # different user than the one installing it.
    # See: https://github.com/Homebrew/homebrew-core/issues/6975
    # Also: https://github.com/Homebrew/brew/pull/1709
    Pathname.glob(libexec/"lib/python*/site-packages/prettytable-0.7.2-py*.egg-info").each do |prettytable_path|
      chmod_R("a+r", prettytable_path)
    end

    man1.install Dir["docs/man/man1/*.1"]
  end

  test do
    ENV["ANSIBLE_REMOTE_TEMP"] = testpath/"tmp"
    (testpath/"playbook.yml").write <<-EOF.undent
      ---
      - hosts: all
        gather_facts: False
        tasks:
        - name: ping
          ping:
    EOF
    (testpath/"hosts.ini").write "localhost ansible_connection=local\n"
    system bin/"ansible-playbook", testpath/"playbook.yml", "-i", testpath/"hosts.ini"

    # Ensure requests[security] is activated
    script = "import requests as r; r.get('https://mozilla-modern.badssl.com')"
    system libexec/"bin/python", "-c", script
  end
end
