Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793986621;
	b=TXpcPmZ+2zNYVzYK3L4oihBrJeOscuhap0lvIPFOR5K7OB+YAkRP0CbXujgkI23pV/1J
	 TsQSE43wZOCZI+GFpIgEpXWJIkoWlQ3Duy63D5P/SWuw/30yG9vGQ1+d6S7F5yAtxZI82
	 6YKR94k3w6xZQAqAXdWQbo/k++672PuRn1aeV101an9EALeoohblcOvrLPWcsQ1ha25HY
	 Z11a1oOG1A5g0zihMJKD6eMuENgduaNqkmP6NBQXjHg2v5+PDy3z3sV8bqEjp9p/fcwYW
	 N8IoCiAe1A5ZXNTfl12GCjTSPPq5go6WGKO3MnYICvl7w5Tjn4OeFk5EvLhhXVhpCkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793986621;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:CC:Date:
	 Message-ID:In-Reply-To:References:User-Agent:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=YYev/NC+kvw4uKd6ceqPEumrLblYo4RG50oIiemWCCg=;
	b=UxSjF6oixTVs5c/tanEwMcDkbuOlx6bpODwd4/aG72bhEnCoqU6Amjn6j9hC+bw1l4ue
	 BBuhjrDDs2j0NCqjLDqcP6u1x2oix6ib17fO9G3o4cbiM8ac/1TdsqXncRzjCs3hzsA7V
	 HmlsYrZbzNTjyPNOIMsieozkWJBzKfokps2sq+22V6KUhoFGIsijD+WjgEZsMeeGF7bON
	 HxCNgdluRXAl926Gdfh4YGE5kn7qT6k39XZKIz9LyWP6MLNxB1rYfDkiiJ+Xv0ar1tcAB
	 CiKBXKkp7YBaMAAEceJiJzx8DBwEJzX5kFC5UT1lbGquhJpSBs9DIt3j8O6umN/uSrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=VhtTr3RO;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9399B606A330
	for <asahi@lists.linux.dev>; Fri,  6 Nov 2026 17:37:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9399B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=VhtTr3RO
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3b0e61a4decso560140a91.2
        for <asahi@lists.linux.dev>; Fri, 06 Nov 2026 09:37:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793986620; x=1794591420;
        h=content-transfer-encoding:content-type:mime-version:subject
         :user-agent:references:in-reply-to:message-id:date:cc:to:from
         :dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YYev/NC+kvw4uKd6ceqPEumrLblYo4RG50oIiemWCCg=;
        b=i2jKaEr0qrQDGzx9yoqPIHRzVplRmB7rskByrTK+7Vzv1Xh2Tz7ZqGTtlerYeJxFLE
         es76EFgXjkSbUU3NvZYPq/+Oap/dTVN/8vD9Y/5SRm5+Ekx9oMkdJzucuqT/9ILgPFwg
         e/Q8Q6WBTYFXkIoBJdkoQqzGxp+lSwGvz1b56cWcJ4hJIYd0i4pSrlHsGbzmWJIRjyGB
         Zfma9BKmJxp2oM9swhYOWxnjtEZ3pPEUUKgQcWgXU5POY4bY6Rn6A13RYbLLPRdboC7g
         sX2MqlpYiVeKeDkpxcgsdaDfaXeLkJvxPKjyzdsmq/mSFnA31a4rAv2Z82beohG16Lxs
         p3ag==
X-Gm-Message-State: APuU4Z9EGhXjpj4MwB69LaD7GvfxfCo2TZ2qFlgz9KWaM17Z48Q+ary5
	Q+Bpz4jrpDixcelE7u9C/juBfc3exZ1k8PzPH5UMeAlXus2//ZYO43MrpCTU3soyzW7nDIHDo8i
	W+xv7fa8Vt/S8Q+uZmSPmkqsSA6fuIb/wfdmOYKeyYwSpbncj5Bcxxx3XGbHwiDzle4EKm4szrj
	AVh96DN2srOTFlCms7IVOewtMoucCezo0MyKFQ6ZpdqTDk6GdjUXRI00e3wWoWybhUZ8kofVNxz
	fEcNkPl7HuOog==
X-Gm-Gg: AYBFou2WZNWt0XRYtCF86PR5mrZk64ZLHhUEMVN2zvwbaR0erN0VYjoiskgOT5QXGKf
	8mY9EgjcbVMHLaGXheVWuRhHwiE8LWf7hZLUXzGQxzRKndsKL2cAK/Z1stfbqHzpecDnJFuQbjf
	E5gymUhV69HuP1/Xx52Mnmy1QVxLLxqCXOgNjPblsJOiS4uLx5wFMVOYq7jxCAMH6Lfk3ZBqAVH
	3VuYeZvmN5n00lDHX9uCnbZ6lplblCg6rrTZbL/2xHwznjoPUgZrVdff+2uB5bB8Q9rbBQVAu2t
	6uOwzhqr2aGgkuGperXssXfwAHYY4i6F9UTqHI/EQ75q0hOOXNc1zZsFDNbLIC60sWsLvcv96Mi
	MjK9LyHQPeCfoiPY1mvy7jBZueWwZVjr/SsoazuaUJlR5j1A730l+KgY8pNfeSggmqu5yuQbY9S
	QxzWmMrRuGgVKMXGGxifNU6lPqW6Pr5wBKR4eq09U=
X-Received: by 2002:a17:90b:39ac:b0:3b0:9cc6:62bc with SMTP id 98e67ed59e1d1-3b0db6ebd52mr3161104a91.37.1793986619836;
        Fri, 06 Nov 2026 09:36:59 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b0d7da8e5asm2136413a91.3.2026.11.06.09.36.59
        for <asahi@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Nov 2026 09:36:59 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c25edb54d22so126941866b.1
        for <asahi@lists.linux.dev>; Fri, 06 Nov 2026 09:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793986618; x=1794591418; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:subject
         :user-agent:references:in-reply-to:message-id:date:cc:to:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YYev/NC+kvw4uKd6ceqPEumrLblYo4RG50oIiemWCCg=;
        b=VhtTr3RO3PvS9qOlioM184RmtJFrHuZJVJnDPMgMur1evBdIuHOdpC29v0yx+40tg7
         /tAnPsbeyQH+CTjt1aBQTcmtaFtKI/qC91uHtzRsyEwTGYHOF9Kg4biOO9mGRjKbGAR1
         7/A08kO2PmiLa0YzcvLpw/kuAuR37YH/1RFYk=
X-Received: by 2002:a05:6402:2b92:b0:6b5:90d9:70a with SMTP id 4fb4d7f45d1cf-6b5977c1176mr2516070a12.15.1793986617859;
        Fri, 06 Nov 2026 09:36:57 -0800 (PST)
X-Received: by 2002:a05:6402:2b92:b0:6b5:90d9:70a with SMTP id 4fb4d7f45d1cf-6b5977c1176mr2516038a12.15.1793986617494;
        Fri, 06 Nov 2026 09:36:57 -0800 (PST)
Received: from [192.168.178.59] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b664ad2d0bsm919103a12.10.2026.11.06.09.36.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 09:36:54 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: =?UTF-8?B?QW5kcsOpIEVpa21leWVy?= <dev@deq.rocks>
CC: <asahi@lists.linux.dev>, <brcm80211-dev-list.pdl@broadcom.com>, <brcm80211@lists.linux.dev>, <dberlin@dberlin.org>, <frankyl@broadcom.com>, <gustavoars@kernel.org>, <j@jannau.net>, <kees@kernel.org>, <kvalo@kernel.org>, <linux-hardening@vger.kernel.org>, <linux-kernel@vger.kernel.org>, <linux-wireless@vger.kernel.org>, <marcan@marcan.st>, <meuleman@broadcom.com>, <michael.reeves077@gmail.com>, <pieterpg@broadcom.com>, <vanhoefm@gmail.com>
Date: Fri, 06 Nov 2026 18:36:52 +0100
Message-ID: <1a1b1ef4b20.2873.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <20261106153612.2aadef2a@kait2en-mbp15-1>
References: <20261106153612.2aadef2a@kait2en-mbp15-1>
User-Agent: AquaMail/2.8.1 (build: 200801029)
Subject: Re: [PATCH 05/13] wifi: brcmfmac: Negotiate PCIe mailbox transport with firmware
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Op 6 november 2026 15:36:19 schreef André Eikmeyer <dev@deq.rocks>:

> Hi Michael,
>
> I tested 01, 04 and 05 on a T2 Macbook Air 9,1 (BCM4377/4). IIRC should be
> the same chip as on T2 Macbook 15,4.
>
> Arend, with the patch we get D3 ACK on s2idle and s3. So this basically
> renders the D3 ACK WoWL workaround patch obsolete, you recently acked.
> So it will suspend now without refusing d3cold transition, but BT is still
> dead on resume, which is a separate issue. Just mentioning...

Sorry, you lost me there. What is the relation between the patch in this 
subject and D3 ack.

Regards,
Arend


