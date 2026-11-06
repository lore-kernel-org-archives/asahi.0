Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793945129;
	b=AINgNJlkiI+b3+fkhhCBNP0G60K0Wvx9YkatUBgiCMFDWRBLB3/lIL6VS+3tfREGbeiU
	 uwcb4ELULBVZYxVwCIrfYv27YK9arulvXGbo2eTUqBb/3lMn7n8tHbgj9ml69K0RCFfVp
	 KtlQVtdVL/jCGynifYYh9mGrTfkf2ExCfzKfWh+xfVXqQqtqQzQoykrFtYkCN9mFgXVOt
	 9Uve10oCUWrTBp1Z6Qgt+85Y237q7lXh0xMtJ2tHrkrbg0zcyt53GkqllDgLL8FLkd/0x
	 MwfmH7l/AfkAA5gLQburODw7lUAeHlm8pMO8JI13Gn/KA1it3AH8iFBzJshXnkHvp5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793945129;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=5KBUz5itfW2H0npvZHDcjaGSjYLfy+DCPcwOiE7R4cY=;
	b=XAfCU6Mq6Am+5NUvzg3olKY+Ygf3Kdn2EPLO0VGofpqMGh8a5ZaIRTkiGUbjn1d8T4qH
	 xQCJpBwZZQC8HqvfQ2aqDK8dlWd6Ay7i3H1xBTgg64kNv7ciwK6ZOpFUbuqc3LD45n3nk
	 C+H86rYY7VGRVRiFOemjwtOabAAWPWy/yXpdyiULDx8aH3EW3RCtap53pjLDff6UEDoU8
	 GYxu3Fp9EZLxAE4MQj2HmkwgJZnGJ+99FWXzrCRJFwoKj1tdGfygHD3OkJKhibWvN0aLa
	 t6xLsmAGYCj3mk8W6RjH7B35LQzH3aECLXU/QZ/eSzxUZmyLGyBmJhKG/PeBHbymlog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YWR8Xncg;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D56606A329
	for <asahi@lists.linux.dev>; Fri,  6 Nov 2026 06:05:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2D56606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YWR8Xncg
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8a05e3f0d23so111078b3a.0
        for <asahi@lists.linux.dev>; Thu, 05 Nov 2026 22:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793945128; x=1794549928; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5KBUz5itfW2H0npvZHDcjaGSjYLfy+DCPcwOiE7R4cY=;
        b=YWR8XncgUy4LGmblVU/RsVDawpmd/k6JBBTt9P/K7AtnNbCyPobk2w+4XeIP94eUhm
         FjIeOTcNkxs5FVu3gsoGSa3XLGGVdIxLUo1NoPkurwjPHykh5SdKzQTRbNZSH5oQlJ/I
         /4Dl/2Jf9l8S2vdDHwiqSDp215wJv8EOMowPkl6eBtpugR34Nh9vMxtACuBvqiYRdc1M
         aIJfgdQs+8vADuewlFXK1NcZ1T91AL9GlObYyYhLBgJu++NtLCQtMJH9RKx5IoaHigIR
         iBUqCgICqTT7Qlt10Su810SoyxAlq9L7cEO90ZhSerSIDFrRl9nuHRUtikoFGheUoQy4
         wWqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793945128; x=1794549928;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5KBUz5itfW2H0npvZHDcjaGSjYLfy+DCPcwOiE7R4cY=;
        b=UJpr/olPIPSPyRZQz/0DOIiRveNTjKMYejDPxQJTvN1RGlHtT4Tx1R3BZr5f74iuZN
         5vfScE3GI2jC69S4YP9NfwZelyRbIEHCwJvdRate6EfB5aOqi0XhW+0EPiWd1oO2HzD3
         zdI44YNELKkiU3e42RhCHNPCsYXT9Kx+GTmGFfJroazr6VnC9Ypyby2HmBoH6FyGsgYz
         6E//WGgOKjnLH0htoIY6CYe/wNPU/r1LYk9f/aTcoTtoEYircq6pBKiwhvnrVyZy2RYP
         +8POflAyqIBXZVEs7YeNN6FZVesvBnNAKOoSXqtQBdtO2ixI2HI8Y1IvYaIGSq8ycXEA
         taKA==
X-Forwarded-Encrypted: i=1; AKwUvByhCw49AYo/CbJ1DgkQCBIY4gcqauajRdC7iqofPpznMBdAGlTF0m3OKDarawTJq1lGyP6oCg==@lists.linux.dev
X-Gm-Message-State: APuU4Z9okarhXoAYHZbg9zZkf5akC+FX5CHJFQrWeQvzihECQIUleN1W
	3k/C7dAD+4hXFgAZBghmrxfxeAiNstrRHE3hFT9Ax0Oeytwu8L4buj1j
X-Gm-Gg: AYBFou1Rd5wh6Kgcr7hcDgSB54vtzwCADPsoh45DHfezoog3ECO/00DlgjvTJWtVgyn
	thUsMrMA/MUNCT2jSm5T0UIG8y6ZPA+Kteuu22YYCZH/NErfOH8BbnOnuy1DksPH2RnJWroYs4a
	XJy1IxjC+OvG/Y4n3D5pgTIS8b1hwopvSWySoi0m9Bxbt1hIH2NctVdu68KTz5drYr7L9pDEN9V
	21uXmpuOPMIvthGBWKQmBfYlFGTAVxHFPCLAVe+UmIoW+bFIvFWtaE4G83JSwJN98YMM/DTPqd9
	rKjmgKETmyARdcFOtpgWEsYTXjd9XmlI6BDedTgxkvmYKU1W0gHorwwXvGiDBwcPrAiVzDkZVeb
	XXSBn6lvzfNCgPANPUO2iED9ZcX+qap8EsKlOWtZLaIINHLCQxUj50Go7ISSS+KdKjH+8NG/GC9
	mtYvupy7OqLOFm2n5N9TNnzl2vqJ50/ItlwMydi0KLsiC+SjfHVLwGIq7eAjkBQKIxAbr39siLJ
	kejtdtObj0sh0W8qgHj3rH0bxNqjBVADrapTva6ab/aOB1Pf0AcjqHjLWJSdxMBk1do+hxDCoXn
	JtLRKzUlbWUE+1F/MmX1tPQvorEi
X-Received: by 2002:a05:6a00:4211:b0:87c:e44e:5694 with SMTP id d2e1a72fcca58-8b37ae9cca3mr1380301b3a.21.1793945127925;
        Thu, 05 Nov 2026 22:05:27 -0800 (PST)
Received: from macbookair ([150.203.68.27])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b3597f0161sm306194b3a.26.2026.11.05.22.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 22:05:26 -0800 (PST)
Date: Fri, 6 Nov 2026 17:05:19 +1100
From: Myria Sarvay <myrialsarvay@gmail.com>
To: Andre Eikmeyer <dev@deq.rocks>
Cc: marcel@holtmann.org, luiz.dentz@gmail.com,
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
	sven@kernel.org, j@jannau.net, neal@gompa.dev,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Yossef Osman <Yossef.Osman@proton.me>,
	Aditya Garg <aditya.garg@linux.dev>
Subject: Re: [PATCH v2 1/2] Bluetooth: btbcm: raise ACL priority on Apple
 Broadcom controllers
Message-ID: <au1uH6uxtsw2vHfP@macbookair>
References: <20261105085750.120392-1-dev@deq.rocks>
 <20261105085750.120392-2-dev@deq.rocks>
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105085750.120392-2-dev@deq.rocks>

On Thu, Nov 05, 2026 at 09:57:49AM +0100, Andre Eikmeyer wrote:
> On the MacBookPro15,1 (BCM4364B0 over UART) A2DP audio drops out as
> soon as WLAN runs on 2.4 GHz with traffic. The host keeps the eight ACL
> buffers of the controller filled, but the controller holds single ACL
> packets for 160-200 ms, so the sink runs dry.
> 
> Sending the Broadcom vendor command 0xfc57 (HCI_BRCM_SET_ACL_PRIORITY,
> handle and priority, as used by the Android Broadcom vendor library) with
> priority high for the audio link stops the dropouts. Setting it back to
> normal brings them back right away. The BCM4377 of the MacBookAir9,1
> accepts the command as well.
> 
> Raise the priority for every BR/EDR ACL link once its Connection Complete
> event arrives. This covers audio as well as HID links. hci_bcm does this
> on Apple machines only, hci_bcm4377 always, since it only runs on Apple
> machines. The PCIe driver receives events in hard interrupt context, so
> the command is queued from a work item.
Hi Andre,

Just wanted to point it out, if you hadn't seen it before, that Sasha
has in the past sent a different patch [1] to run these priority
commands. They seem to take a different approach to when to enable/run
them. Wasn't sure if one was better or worse though.

Thanks,
Myria

[1]: https://lore.kernel.org/asahi/20260525-brcm-prio-v3-1-6259e10233f8@chaosmail.tech/
