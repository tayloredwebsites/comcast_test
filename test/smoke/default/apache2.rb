# # encoding: utf-8

# Inspec test for recipe .::apache2

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/


# confirm output from apache is coming out from both http and https
describe command('curl http://localhost:80') do
  its(:stdout) { should match(/SRE CHALLENGE/)}
end
describe command('curl http://localhost:443') do
  its(:stdout) { should match(/SRE CHALLENGE/)}
end
describe command('curl https://localhost:443') do
  its(:stdout) { should match(/SRE CHALLENGE/)}
end

describe command('curl http://comcast_test:80') do
  its(:stdout) { should match(/SRE CHALLENGE/)}
end
describe command('curl http://comcast_test:443') do
  its(:stdout) { should match(/SRE CHALLENGE/)}
end
describe command('curl https://comcast_test:443') do
  its(:stdout) { should match(/SRE CHALLENGE/)}
end

# confirm http and https ports are open
describe port(80) do
  it { should be_listening }
end
describe port(443) do
  it { should be_listening }
end
