Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365DEA3C
	for <asahi@lists.linux.dev>; Tue, 24 Jan 2023 04:42:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: lina@asahilina.net)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 52B2C4246F;
	Tue, 24 Jan 2023 04:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
	s=default; t=1674535362;
	bh=WN44PrcFYfKoSeZ8iNlkhBh4hAFJ2coVdS4b3nGwky4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=s6egbtndiSbiZ/wVjze+mu8WzgzI0W5aW1+npUC4X3VfE49li/f2dcxgMfKRdMl5H
	 20nlbjOJ1Ruok6qYMdRcs6/+isZz20t/8hPdiiwCbLbHbP5le/67Q3wcF8Q4EL1ony
	 0bJaadrNRJ2vnkydz41McBsDozAPGvrNyZfzKFCk99o/ieWO7rOIIrqMKGbma+aADA
	 vfT8pf5Bz/rqITgH8ACqEWE58vaTYqB8BCpu2UhMhD7UcjSxZe6B4Q9pLu0oW7KH7k
	 U+hBvwVHEo+W8szYaiinwBsCyvKqqW/sgeWW8dXJoedRZ+MTdiiCHzq3XKakanj1jy
	 5VykBTJpsSmzA==
Message-ID: <3ddc508c-749d-801c-83fe-c5c4de31498a@asahilina.net>
Date: Tue, 24 Jan 2023 13:42:38 +0900
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2] soc: apple: rtkit: Add register dump decoding to
 crashlog
Content-Language: en-US
To: Eric Curtin <ecurtin@redhat.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230123031728.22515-1-lina@asahilina.net>
 <CAOgh=FwHc_sy5dfQo8OvnG+gfy6UpW08a6qA7R9ErytG83NHrQ@mail.gmail.com>
From: Asahi Lina <lina@asahilina.net>
In-Reply-To: <CAOgh=FwHc_sy5dfQo8OvnG+gfy6UpW08a6qA7R9ErytG83NHrQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/01/2023 21.18, Eric Curtin wrote:
> On Mon, 23 Jan 2023 at 03:19, Asahi Lina <lina@asahilina.net> wrote:
>>
>> When the coprocessor crashes, it's useful to get a proper register dump
>> so we can find out what the firmware was doing. Add a decoder for this.
>>
>> Originally this had ESR decoding by reusing the ARM64 arch header for
>> this, but that introduces some module linking and cross-arch compilation
>> issues, so let's leave that out for now.
>>
>> Reviewed-by: Sven Peter <sven@svenpeter.dev>
>> Reviewed-by: Eric Curtin <ecurtin@redhat.com>
>> Signed-off-by: Asahi Lina <lina@asahilina.net>
>> ---
> 
> I would be thinking, rather that duplicating the PSR_MODE_* defines
> and values, why not just ifdef the whole
> "apple_rtkit_crashlog_dump_regs(" function and the "case
> APPLE_RTKIT_CRASHLOG_REGS" part (and maybe even
> apple_rtkit_crashlog_regs struct also). Is it worth compiling that
> code on other CPU architectures when PSR seems to be an ARM specific
> thing?

It's mostly just for compile testing! The code is about the architecture
of the coprocessor, not the host CPU, so it still makes sense in
principle (though of course it's not very likely that SoCs with a
combination like that will ever exist). It helped the kernel test robot
find a bad format specifier in this code during a compile test run for a
32-bit arch, so I think it makes sense to keep it.

~~ Lina
