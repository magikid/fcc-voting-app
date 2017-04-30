=begin
Copyright (c) 2012-2017 joshua stein <jcs@jcs.org>

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions
are met:

1. Redistributions of source code must retain the above copyright
   notice, this list of conditions and the following disclaimer.
2. Redistributions in binary form must reproduce the above copyright
   notice, this list of conditions and the following disclaimer in the
   documentation and/or other materials provided with the distribution.
3. The name of the author may not be used to endorse or promote products
   derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
=end

class ShortId
  attr_accessor :klass, :generation_attempts

  def initialize(klass)
    self.klass               = klass
    self.generation_attempts = 0
  end

  def generate
    until (generated_id = candidate_id) && generated_id.valid? do
      self.generation_attempts += 1
      raise 'too many hash collisions' if generation_attempts == 10
    end
    generated_id.to_s
  end

  def candidate_id
    CandidateId.new(klass)
  end

  private

  class CandidateId
    attr_accessor :klass, :id

    def initialize(klass)
      self.klass = klass
      self.id    = generate_id
    end

    def to_s
      id
    end

    def generate_id
      random_str(6).downcase
    end

    def valid?
      !klass.exists?(short_id: id)
    end

    private

    def random_str(len)
      str = ""
      while str.length < len
        chr = OpenSSL::Random.random_bytes(1)
        ord = chr.unpack('C')[0]

        #          0            9              A            Z              a            z
        if (ord >= 48 && ord <= 57) || (ord >= 65 && ord <= 90) || (ord >= 97 && ord <= 122)
          str += chr
        end
      end

      return str
    end
  end
end
