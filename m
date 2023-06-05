Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396EE19B
	for <asahi@lists.linux.dev>; Mon,  5 Jun 2023 01:30:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 896FF42450;
	Mon,  5 Jun 2023 01:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1685928122; bh=6z/0S9faUaZ6zgRpxpD/gzAmGLCL2N5TsJeJv9RS2l8=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To;
	b=KFq/P4B5tUrlQxvEizSZXMBcTuLu+y5/lBnfDQZT1XLK6pMGS5bo5YMZqmfBN9MfM
	 QvCbMMGUGFhdg0hnhDHEILYO7LoJDLP1Qkqqa2xA1Ht88GLv0mKHw8EpwbolIxeEAC
	 jtNzblqxtAS8yoBbO4iBRzvr1Blq9DZ3l/urdnonQ7qd0lWjMgOXi7MiXqsAfjQk+R
	 qRCzOfdd6R6lm2yRiTmlRRvibPUnrzptgYwI5XIquYVGu5lAUwNqMa7ILtkfsQhuCh
	 LhSAoNH2QMpRtzeFMaiw+d6wIiuL4jZUv3OEDOD2PeHFqm7jZZz7hEWKrlloc/QZvD
	 qzblQAwFzhjDw==
Message-ID: <69ea054d-9e3a-6a84-a38b-796f6f152961@marcan.st>
Date: Mon, 5 Jun 2023 10:21:58 +0900
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: linux-next: build failure after merge of the asahi-soc tree
Content-Language: en-US
From: Hector Martin <marcan@marcan.st>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Asahi Linux <asahi@lists.linux.dev>
References: <20230605085816.4f54bb43@canb.auug.org.au>
 <E17AC653-8534-4189-ACDF-F6CCD1C1D9F0@marcan.st>
In-Reply-To: <E17AC653-8534-4189-ACDF-F6CCD1C1D9F0@marcan.st>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/06/2023 08.11, Hector Martin "marcan" wrote:
> Hi!
> 
> Thanks, looks like a missing include. I'll fix it up when I get home in a bit. Sorry for the noise!
> 
> (And apologies for top-posting, I'm on mobile right now)
> 

Should be fixed now, thanks again!

TIL that allmodconfig includes COMPILE_TEST. Makes sense though. I don't
build test for x86 often, and I think on arm64 we get bitfield.h pulled
in via common headers, so this isn't the first time I've missed this one...

> On June 5, 2023 7:58:16 AM GMT+09:00, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> Hi all,
>>
>> After merging the asahi-soc tree, today's linux-next build (x86_64
>> allmodconfig) failed like this:
>>
>> In file included from include/linux/io.h:13,
>>                 from drivers/soc/apple/mailbox.c:22:
>> drivers/soc/apple/mailbox.c: In function 'apple_mbox_send':
>> drivers/soc/apple/mailbox.c:151:24: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
>>  151 |         writeq_relaxed(FIELD_PREP(APPLE_MBOX_MSG1_MSG, msg.msg1),
>>      |                        ^~~~~~~~~~
>> arch/x86/include/asm/io.h:103:42: note: in definition of macro 'writeq_relaxed'
>>  103 | #define writeq_relaxed(v, a)    __writeq(v, a)
>>      |                                          ^
>> drivers/soc/apple/mailbox.c: In function 'apple_mbox_poll_locked':
>> drivers/soc/apple/mailbox.c:188:28: error: implicit declaration of function 'FIELD_GET' [-Werror=implicit-function-declaration]
>>  188 |                 msg.msg1 = FIELD_GET(
>>      |                            ^~~~~~~~~
>>
>> Caused by commit
>>
>>  0d1f3f7f8486 ("soc: apple: mailbox: Add ASC/M3 mailbox driver")
>>
>> I have used the asshi-soc tree from next-20230602 for today.
>>
> 
> - Hector

- Hector

