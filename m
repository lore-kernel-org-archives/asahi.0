Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BFD33D6
	for <asahi@lists.linux.dev>; Fri, 24 Feb 2023 14:45:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: lina@asahilina.net)
	by mail.marcansoft.com (Postfix) with ESMTPSA id A40AC3FA55;
	Fri, 24 Feb 2023 14:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
	s=default; t=1677249906;
	bh=S1h+B0qxGOxw6VVX44ZvWypG2zHrxFFK2zOWdFGJ3lE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=t0xd4A5jkegy1YFQ6YxnouRPhGKnWfoka0evEox2WtHsnqgOWh9c4oWlquthowt+H
	 sMHdWcaI8MzvHbTl1obv1nzaSinyfCbhhjnBDhP22p70Wd+qja336nYo9oSy1tfZKB
	 oQEJcAerFPUnf2Qey2+VA8mJt2Kzq0DarRQLVc07zbkrXlfGzwhyDAHXe/cZ/qAuxq
	 PnbE+LrQ3FWjNqqtpnmesa4RKHJKUM5COKVVLXyKuBc8uWbN/PeJJVsmLQyWXDtX1r
	 KfT/nZdpLoK9rkIcCt6worIzQ/e7vjmquZ0CQ07HmMvSzcr4qqlXik+B0h7/lHhRBp
	 Z+FpQ0t4RSWcg==
Message-ID: <bbc824ee-ef4e-40cb-f009-0d693d757869@asahilina.net>
Date: Fri, 24 Feb 2023 23:44:59 +0900
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 2/5] rust: device: Add a minimal RawDevice trait
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=c3=b6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Arnd Bergmann <arnd@arndb.de>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev
References: <20230224-rust-iopt-rtkit-v1-0-49ced3391295@asahilina.net>
 <20230224-rust-iopt-rtkit-v1-2-49ced3391295@asahilina.net>
 <Y/ieQ0UX/niAG1Hg@kroah.com>
 <ef3a3638-6381-87ab-d674-644306b6b6ce@asahilina.net>
 <Y/jFeZzZVCpBGvGv@kroah.com> <Y/jHeP4LileLYxO8@kroah.com>
From: Asahi Lina <lina@asahilina.net>
In-Reply-To: <Y/jHeP4LileLYxO8@kroah.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2023/02/24 23:19, Greg Kroah-Hartman wrote:>> Can we see some users
of this code posted so I can see how struct device
>> is going to work in a rust driver?  That's the thing I worry most about
>> the rust/C interaction here as we have two different ways of thinking
>> about reference counts from the two worlds and putting them together is
>> going to be "interesting", as can be seen here already.
> 
> Also, where are you getting your 'struct device' from in the first
> place?  What bus is createing it and giving it to your rust driver?

That would be platform for my GPU driver, matched via OF compatible.

~~ Lina
