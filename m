Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFBA8F4A
	for <asahi@lists.linux.dev>; Thu, 23 Mar 2023 12:24:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: lina@asahilina.net)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 64F76420CF;
	Thu, 23 Mar 2023 12:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
	s=default; t=1679574277;
	bh=evK26XP+VWwN+ankkNlXWjHyFQ7pC9PLQ5q3VGomw9U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=t02o3GeQPXL0bByZ8BwP4gEYEhQCU8L9pPgT5HtN9qmkj8W437StJDAGC10zyWenZ
	 5RN4UI3G6/pRAhpEkopeB9oDY9d3ELPgmzmovmA4VX6EzjJD/FSAMQr5ADEEEFrRN5
	 A+DhqvArcDpZUk2u7FZwJ1TwbXD0GsxlBrftOJlOyCz4fyQyrvB1RO/kFLBlwkjorl
	 3b2/epzJ/+t/msptCCSKLsjMPndnx+ZlDfrHx+i100jAT7GYLdZog9LP7bdgKk0Dz3
	 KnjcNHkgkwro0oZ7W3NvXM43fuO2UKLtcJnntu3S6qfDecw+FET616stujadtu6LO+
	 7I0eGTKRwpM1g==
Message-ID: <1fad33a2-cba4-8ae9-0966-67ea24177149@asahilina.net>
Date: Thu, 23 Mar 2023 21:24:31 +0900
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2] rust: ioctl: Add ioctl number manipulation functions
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=c3=b6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 asahi@lists.linux.dev, Linux-Arch <linux-arch@vger.kernel.org>
References: <20230224-rust-ioctl-v2-1-5325e76a92df@asahilina.net>
 <56a3e16e-d686-440e-86b7-ee41f9d19fb1@app.fastmail.com>
From: Asahi Lina <lina@asahilina.net>
In-Reply-To: <56a3e16e-d686-440e-86b7-ee41f9d19fb1@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/03/2023 21.18, Arnd Bergmann wrote:
> On Thu, Mar 23, 2023, at 13:08, Asahi Lina wrote:
>> Changes in v2:
>> - Changed from assert!() to build_assert!() (static_assert!() can't work here)
> ...
>> +/// Build an ioctl number, analogous to the C macro of the same name.
>> +const fn _IOC(dir: u32, ty: u32, nr: u32, size: usize) -> u32 {
>> +    core::assert!(dir <= bindings::_IOC_DIRMASK);
>> +    core::assert!(ty <= bindings::_IOC_TYPEMASK);
>> +    core::assert!(nr <= bindings::_IOC_NRMASK);
>> +    core::assert!(size <= (bindings::_IOC_SIZEMASK as usize));
> 
> Just to make sure: did you actually change it according
> to the changelog? It still looks like a runtime assertion
> to me, but I don't really understand any rust.

Umm... I'm not sure what happened there.

Sorry, I'll resend it. I ran into some unrelated pain with bindgen 
versions while trying to compile-test this, and along the way I must 
have somehow dropped the actual v2 change...

~~ Lina

