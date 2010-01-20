require 'rubygems'
require 'ffi'

module Net::CURL::Lib
  extend FFI::Library

  ffi_lib 'libcurl'

  CURLcode = enum(
    :CURLE_OK, 0,
    :CURLE_UNSUPPORTED_PROTOCOL,    # 1
    :CURLE_FAILED_INIT,             # 2
    :CURLE_URL_MALFORMAT,           # 3
    :CURLE_OBSOLETE4,               # 4 - NOT USED
    :CURLE_COULDNT_RESOLVE_PROXY,   # 5
    :CURLE_COULDNT_RESOLVE_HOST,    # 6
    :CURLE_COULDNT_CONNECT,         # 7
    :CURLE_FTP_WEIRD_SERVER_REPLY,  # 8
    :CURLE_REMOTE_ACCESS_DENIED,    # 9 a service was denied by the server
                                    # due to lack of access - when login fail
                                    # this is not returned.
    :CURLE_OBSOLETE10,              # 10 - NOT USED
    :CURLE_FTP_WEIRD_PASS_REPLY,    # 11
    :CURLE_OBSOLETE12,              # 12 - NOT USED
    :CURLE_FTP_WEIRD_PASV_REPLY,    # 13
    :CURLE_FTP_WEIRD_227_FORMAT,    # 14
    :CURLE_FTP_CANT_GET_HOST,       # 15
    :CURLE_OBSOLETE16,              # 16 - NOT USED
    :CURLE_FTP_COULDNT_SET_TYPE,    # 17
    :CURLE_PARTIAL_FILE,            # 18
    :CURLE_FTP_COULDNT_RETR_FILE,   # 19
    :CURLE_OBSOLETE20,              # 20 - NOT USED
    :CURLE_QUOTE_ERROR,             # 21 - quote command failure
    :CURLE_HTTP_RETURNED_ERROR,     # 22
    :CURLE_WRITE_ERROR,             # 23
    :CURLE_OBSOLETE24,              # 24 - NOT USED
    :CURLE_UPLOAD_FAILED,           # 25 - failed upload "command"
    :CURLE_READ_ERROR,              # 26 - couldn't open/read from file
    :CURLE_OUT_OF_MEMORY,           # 27
    # Note: :CURLE_OUT_OF_MEMORY may sometimes indicate a conversion error
    #       instead of a memory allocation error if :CURL_DOES_CONVERSIONS
    #       is defined
    :CURLE_OPERATION_TIMEDOUT,      # 28 - the timeout time was reached
    :CURLE_OBSOLETE29,              # 29 - NOT USED
    :CURLE_FTP_PORT_FAILED,         # 30 - FTP PORT operation failed
    :CURLE_FTP_COULDNT_USE_REST,    # 31 - the REST command failed
    :CURLE_OBSOLETE32,              # 32 - NOT USED
    :CURLE_RANGE_ERROR,             # 33 - RANGE "command" didn't work
    :CURLE_HTTP_POST_ERROR,         # 34
    :CURLE_SSL_CONNECT_ERROR,       # 35 - wrong when connecting with SSL
    :CURLE_BAD_DOWNLOAD_RESUME,     # 36 - couldn't resume download
    :CURLE_FILE_COULDNT_READ_FILE,  # 37
    :CURLE_LDAP_CANNOT_BIND,        # 38
    :CURLE_LDAP_SEARCH_FAILED,      # 39
    :CURLE_OBSOLETE40,              # 40 - NOT USED
    :CURLE_FUNCTION_NOT_FOUND,      # 41
    :CURLE_ABORTED_BY_CALLBACK,     # 42
    :CURLE_BAD_FUNCTION_ARGUMENT,   # 43
    :CURLE_OBSOLETE44,              # 44 - NOT USED
    :CURLE_INTERFACE_FAILED,        # 45 - CURLOPT_INTERFACE failed
    :CURLE_OBSOLETE46,              # 46 - NOT USED
    :CURLE_TOO_MANY_REDIRECTS ,     # 47 - catch endless re-direct loops
    :CURLE_UNKNOWN_TELNET_OPTION,   # 48 - User specified an unknown option
    :CURLE_TELNET_OPTION_SYNTAX ,   # 49 - Malformed telnet option
    :CURLE_OBSOLETE50,              # 50 - NOT USED
    :CURLE_PEER_FAILED_VERIFICATION, # 51 - peer's certificate or fingerprint
                                     # wasn't verified fine
    :CURLE_GOT_NOTHING,             # 52 - when this is a specific error
    :CURLE_SSL_ENGINE_NOTFOUND,     # 53 - SSL crypto engine not found
    :CURLE_SSL_ENGINE_SETFAILED,    # 54 - can not set SSL crypto engine as
                                    # default
    :CURLE_SEND_ERROR,              # 55 - failed sending network data
    :CURLE_RECV_ERROR,              # 56 - failure in receiving network data
    :CURLE_OBSOLETE57,              # 57 - NOT IN USE
    :CURLE_SSL_CERTPROBLEM,         # 58 - problem with the local certificate
    :CURLE_SSL_CIPHER,              # 59 - couldn't use specified cipher
    :CURLE_SSL_CACERT,              # 60 - problem with the CA cert (path?)
    :CURLE_BAD_CONTENT_ENCODING,    # 61 - Unrecognized transfer encoding
    :CURLE_LDAP_INVALID_URL,        # 62 - Invalid LDAP URL
    :CURLE_FILESIZE_EXCEEDED,       # 63 - Maximum file size exceeded
    :CURLE_USE_SSL_FAILED,          # 64 - Requested FTP SSL level failed
    :CURLE_SEND_FAIL_REWIND,        # 65 - Sending the data requires a rewind
                                    # that failed
    :CURLE_SSL_ENGINE_INITFAILED,   # 66 - failed to initialise ENGINE
    :CURLE_LOGIN_DENIED,            # 67 - user, password or similar was not
                                    # accepted and we failed to login
    :CURLE_TFTP_NOTFOUND,           # 68 - file not found on server
    :CURLE_TFTP_PERM,               # 69 - permission problem on server
    :CURLE_REMOTE_DISK_FULL,        # 70 - out of disk space on server
    :CURLE_TFTP_ILLEGAL,            # 71 - Illegal TFTP operation
    :CURLE_TFTP_UNKNOWNID,          # 72 - Unknown transfer ID
    :CURLE_REMOTE_FILE_EXISTS,      # 73 - File already exists
    :CURLE_TFTP_NOSUCHUSER,         # 74 - No such user
    :CURLE_CONV_FAILED,             # 75 - conversion failed
    :CURLE_CONV_REQD,               # 76 - caller must register conversion
                                    # callbacks using curl_easy_setopt options
                                    # :CURLOPT_CONV_FROM_NETWORK_FUNCTION,
                                    # :CURLOPT_CONV_TO_NETWORK_FUNCTION, and
                                    # :CURLOPT_CONV_FROM_UTF8_FUNCTION
    :CURLE_SSL_CACERT_BADFILE,      # 77 - could not load CACERT file, missing
                                    # or wrong format
    :CURLE_REMOTE_FILE_NOT_FOUND,   # 78 - remote file not found
    :CURLE_SSH,                     # 79 - error from the SSH layer, somewhat
                                    # generic so the error message will be of
                                    # interest when this has happened

    :CURLE_SSL_SHUTDOWN_FAILED,     # 80 - Failed to shut down the SSL
                                    # connection
    :CURLE_AGAIN,                   # 81 - socket is not ready for send/recv,
                                    # wait till it's ready and try again
    :CURL_LAST # never use!
  )


  CURLversion = enum(
    :CURLVERSION_FIRST,
    :CURLVERSION_SECOND,
    :CURLVERSION_THIRD,
    :CURLVERSION_FOURTH,
    :CURLVERSION_LAST, # never actually use this

    :CURLVERSION_NOW, :CURLVERSION_FOURTH
  )

  class CURL_VERSION_INFO_DATA < FFI::Struct
    layout(
      :age, :int,       # age of the returned struct
      :version, :string,       # LIBCURL_VERSION
      :version_num, :uint,     # LIBCURL_VERSION_NUM
      :host, :string,          # OS/host/cpu/machine when configured
      :features, :int,         # bitmask, see defines below
      :ssl_version, :string,   # human readable string
      :ssl_version_num, :long, # not used anymore, always 0
      :libz_version, :string,  # human readable string
      # protocols is terminated by an entry with a NULL protoname
      :protocols, :pointer,

      # The fields below this were added in CURLVERSION_SECOND
      :ares, :string,
      :ares_num, :int,

      # This field was added in CURLVERSION_THIRD
      :libidn, :string,

      # These field were added in CURLVERSION_FOURTH

      # Same as '_libiconv_version' if built with HAVE_ICONV
      :iconv_ver_num, :int,

      :libssh_version, :string # human readable string
    )
  end

  CURL_VERSION_IPV6      = (1<<0)  # IPv6-enabled
  CURL_VERSION_KERBEROS4 = (1<<1)  # kerberos auth is supported
  CURL_VERSION_SSL       = (1<<2)  # SSL options are present
  CURL_VERSION_LIBZ      = (1<<3)  # libz features are present
  CURL_VERSION_NTLM      = (1<<4)  # NTLM auth is supported
  CURL_VERSION_GSSNEGOTIATE = (1<<5) # Negotiate auth support
  CURL_VERSION_DEBUG     = (1<<6)  # built with debug capabilities
  CURL_VERSION_ASYNCHDNS = (1<<7)  # asynchronous dns resolves
  CURL_VERSION_SPNEGO    = (1<<8)  # SPNEGO auth
  CURL_VERSION_LARGEFILE = (1<<9)  # supports files bigger than 2GB
  CURL_VERSION_IDN       = (1<<10) # International Domain Names support
  CURL_VERSION_SSPI      = (1<<11) # SSPI is supported
  CURL_VERSION_CONV      = (1<<12) # character conversions are

  CURL_GLOBAL_SSL     = (1 << 0)
  CURL_GLOBAL_WIN32   = (1 << 1)
  CURL_GLOBAL_ALL     = (CURL_GLOBAL_SSL | CURL_GLOBAL_WIN32)
  CURL_GLOBAL_NOTHING = 0
  CURL_GLOBAL_DEFAULT = CURL_GLOBAL_ALL

  callback :malloc_callback, [:size_t], :pointer
  callback :free_callback, [:pointer], :void
  callback :realloc_callback, [:pointer, :size_t], :pointer
  callback :strdup_callback, [:string], :string
  callback :calloc_callback, [:size_t, :size_t], :pointer

  attach_function :curl_global_cleanup, [], :void
  attach_function :curl_global_init, [:long], CURLcode
  attach_function :curl_global_init_mem, [:long, :malloc_callback, :free_callback, :realloc_callback, :strdup_callback, :calloc_callback], CURLcode

  attach_function :curl_version_info, [CURLversion], CURL_VERSION_INFO_DATA
  attach_function :curl_version, [], :string
end
