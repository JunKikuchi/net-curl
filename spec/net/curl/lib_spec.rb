require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

include Net::CURL::Lib

describe Net::CURL::Lib do
  def be_nil_or_string
    simple_matcher('nil or instance of String') do |given|
      given.nil? || given.instance_of?(String)
    end
  end

  it 'curl_version_info should returns CURL_VERSION_INFO_DATA' do
    data = CURL_VERSION_INFO_DATA.new curl_version_info(:CURLVERSION_NOW)

    data[:age].should be_instance_of Fixnum
    data[:version].should be_instance_of String
    data[:version_num].should be_instance_of Fixnum
    data[:host].should be_instance_of String
    data[:features].should be_instance_of Fixnum
    data[:ssl_version].should be_instance_of String
    data[:libz_version].should be_instance_of String

    ptr_size = FFI.type_size(:pointer)
    protocols = data[:protocols]
    ptr = protocols.read_pointer
    until ptr.address == 0
      ptr.read_string.should be_instance_of String
      protocols += ptr_size
      ptr = protocols.read_pointer
    end

    if 1 <= data[:age]
      data[:ares].should be_nil_or_string
      data[:ares_num].should be_instance_of Fixnum
    end

    if 2 <= data[:age]
      data[:libidn].should be_instance_of String
    end

    if 3 <= data[:age]
      data[:iconv_ver_num].should be_instance_of Fixnum
    end

    data[:libssh_version].should be_nil_or_string
  end

  it 'curl_version should returns the version number of libcurl string' do
    curl_version.should be_instance_of String
  end
end
