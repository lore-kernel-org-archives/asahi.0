Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793714348;
	b=F8oAMHHZYTXAOaFs/8n3t5ajHlIl4CmI5BT8TcddeYuL3TfBZpMKuhh6J26IgczSZtlV
	 ZbsCUNw9o9Z1bV1oAN99Sq/GDSE893DPZQ6/bam+YxBCxLpTFyZhVWSfHoB6el8ydApw7
	 m0kOA6TApVlMKNFXrdnXIXLXW2t6PD6HadCqdaE83+8rhKyYMBqwnotTev6j8vdeK+aL4
	 6Mq6i1BwB0yHkXp9bzi/Bi9UL/hkLPLk1bptheMZDnSuxchall2GW5jwxGaTLV2zhyp7m
	 6K2nV4m534fW/MFHwAEAv6DwN7KTZL0lrMETKKs0+jcHQltwhF/D/18hf8o1JzqrPug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714348;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=bmndstez1ROjl3SXVUcZnwGvUr5BBU/f9ozJwfuLHnI=;
	b=xZw2bWOb24FP8T/IRtLEzdy/YAWpt69fdWTo8FcwunAbPbpuViOAzyBoiXT0mYIUrvjr
	 Yw3fRtQzm4F3D91pjpd8B49h1v9MhX0ivPsqPrPC9PiywIijZ5DgXEeX4csNy9XmpEsDD
	 YDjTAsvU7l3yiZBGa+kXSbHbrXLai5Rx5mOacN7dM02dR+YFpHD3kADKfNj/x012iRtrM
	 GRe7+NN8PNUJj4wUkE3ijtlKkipxejwCUE9onup+HfPmBXKZYTbXuvYBP2GszPXNJzCJG
	 tQ/eW4UkRRme0f2EytByKQ9k7OJrrEoM/ZmY/134HRPwwaT7Uc9SQn/iMtwNBI9AbxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=JeODP2nC;
	arc=none smtp.remote-ip=209.85.222.226
Received: from mail-qk1-f226.google.com (mail-qk1-f226.google.com [209.85.222.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7BD606A326
	for <asahi@lists.linux.dev>; Tue,  3 Nov 2026 13:59:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA7BD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=JeODP2nC
Received: by mail-qk1-f226.google.com with SMTP id af79cd13be357-93e4c00d71aso381313685a.3
        for <asahi@lists.linux.dev>; Tue, 03 Nov 2026 05:59:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793714346; x=1794319146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bmndstez1ROjl3SXVUcZnwGvUr5BBU/f9ozJwfuLHnI=;
        b=zSfaCBF/H4+a2lSvQ7m4TebHkJxvJDvfQ3Knzny4uQTRBUdSpk26PyORXPhgRrJw+p
         plThUCnslrb4gdZ74lu32bxNPJsP51Coi5aFAsJIRXZFJdlDIU9udREF1KBo4WHc9bWI
         i9KOFuEhC8HT8mmt1QBxH33r7KzPTU0/wX38wnkKi2pUxGR0nO1KnfdjfgI84v0C/y8N
         YJlMLC/I4G8WAS8pWw0El9BTDOOBFyenjwl3TS7NyRVBSwDEAu1ojxGWra3I4hRfcfYF
         cVOsA4CdxrfC1cBTjOYJdKOQdT1lASb2ek/b1XPM6G/KhRhL66ArFg9WikhjmpqSQsJp
         Ofqg==
X-Forwarded-Encrypted: i=1; AKwUvBykFij67aZ3B2OlVefAl5/y2/DHjzW1bf5UjnXpW9Hb2T05JwYqYLVbxGQLkbuTqwIY/9hkzg==@lists.linux.dev
X-Gm-Message-State: APuU4Z9OR2+DYSwn1NMWTLr9eEjLMUoZP0nzb7xK8tlaKC1mXGo54c9B
	NAitY1LdgciVIjmm7Gof5SeTAp+OV8IUffCFvZBU/K7vLnhtvVzCIrzPbc2fsKkmUPTvEsNSwjO
	JCu6mbMY2cESxpJg3jRsIGVIkW5jr4t8v3+RYsHLaHSc/GzfidZmm+2ri5ayvbmdNGnmyvvsntk
	vlDIgTpHwfykg9Og+7AfJRGwZ751wZcHmZiJFcRI72YMCZIU/PUa3qb+T5GxhWEBS3pQ9hVokv1
	R3xxIFZgQxR78O2
X-Gm-Gg: AYBFou1RDWclYAScCu6ubS015vPdDVomQr7C/fg9ZoBC7HGa29usUGZXpWCKqC5bvni
	hsC9fB5rrZhTKz0Kspha5EK2rnphW+2Zryh/kBV7DfFYGhuZ15e5/ud8FbpkFwqHKSGkDvMFiLD
	xdO4JJjN7FVTOyUjZjGeOW3bfz4a8TK5qZIWBUoCy3KQPWJoE3LFLCrtxlR9X6tfTuVLn9EIL57
	X1wFNbYkq0/1Lrd5+twr/khv74XjT19bnaC7LKkxwbm/pklJ0TEE2TqwilI54rDKevcP51fmcLl
	NB8at7aeNOSOrQrqfiZVaZr/ACEg/CvXyYZCMcOEfApvDkn8758RiUy08yk/l5R9gdAs5f7Jn3n
	Id0LwAYdTJdqomJuCI98FuplViQZwadmjJBXss47Ff4QfL0F8oXyncbZqDO2H2n0WZtH8OKy8o3
	slqjWobrwbAYVvSvALHwRtZqinX011E50r10LkiKA=
X-Received: by 2002:a05:620a:6f0c:b0:93b:d7a0:d9db with SMTP id af79cd13be357-944217a1aecmr2062674985a.53.1793714345559;
        Tue, 03 Nov 2026 05:59:05 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-94424e8a55csm115838585a.0.2026.11.03.05.59.05
        for <asahi@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Nov 2026 05:59:05 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-139b62317d0so9502398c88.0
        for <asahi@lists.linux.dev>; Tue, 03 Nov 2026 05:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793714344; x=1794319144; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bmndstez1ROjl3SXVUcZnwGvUr5BBU/f9ozJwfuLHnI=;
        b=JeODP2nCgQpDReltOHK8Dnfiv4D/7Ya2DRhKINkadJqRZeiHkWPkOjmNgCkJ72/6yJ
         1Hs2xBzBcb2cuhfHUxfhPjK1arfa0H86tC3olU5gaX5/EojSfgdxj/VOXdwuf9Qy/9te
         HmRKuUocrgMUQYLXLPCL6An0hH9tYhhL6huwc=
X-Forwarded-Encrypted: i=1; AKwUvBwvWVR7SAsWS0SiERxC+CvOfOy6EmpPFb0wKTQVr2SAhOHnoSAmoWJBVWSm+LzZQwr9oPu5qw==@lists.linux.dev
X-Received: by 2002:a05:7022:ea55:20b0:1a2:a5b1:884f with SMTP id a92af1059eb24-1ac5da7726bmr20328260c88.31.1793714344056;
        Tue, 03 Nov 2026 05:59:04 -0800 (PST)
X-Received: by 2002:a05:7022:ea55:20b0:1a2:a5b1:884f with SMTP id a92af1059eb24-1ac5da7726bmr20328216c88.31.1793714343237;
        Tue, 03 Nov 2026 05:59:03 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac18458e07sm41658755c88.8.2026.11.03.05.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:59:02 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Michael Reeves <michael.reeves077@gmail.com>
Cc: Pieter-Paul Giesberts <pieterpg@broadcom.com>,
	"Franky Lin (Zhenhui)" <frankyl@broadcom.com>,
	Mathy Vanhoef <vanhoefm@gmail.com>,
	Kalle Valo <kvalo@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	asahi@lists.linux.dev,
	Hector Martin <marcan@marcan.st>,
	Daniel Berlin <dberlin@dberlin.org>,
	Janne Grunau <j@jannau.net>,
	linux-kernel@vger.kernel.org,
	Hante Meuleman <meuleman@broadcom.com>,
	linux-hardening@vger.kernel.org,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH 04/13] wifi: brcmfmac: Support newer PCIe core startup and interrupts
Date: Tue,  3 Nov 2026 14:58:44 +0100
Message-ID: <20261103135856.3676311-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260925-brcm4388-submit-v1-4-b5cbc2cde2fb@gmail.com>
References: <20260925-brcm4388-submit-v1-4-b5cbc2cde2fb@gmail.com>
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Fri, 25 Sep 2026 23:43:39 +1000, Michael Reeves <michael.reeves077@gmail.com> wrote:
> From: Hector Martin <marcan@marcan.st>
>
> Newer Broadcom chips, such as BCM4388, require changes to PCIe register
> access, watchdog reset, and RAM size detection. PCIe core revision 64
> and higher uses a different BAR0 register window. ChipCommon revision 65
> and higher requires a different watchdog reset sequence.
>
> Update register access and reset for these revisions. Decode the SYSMEM
> bank counts according to the core revision and exclude ROM banks from
> RAM size calculation. Disable all detected D11 cores during CA7 setup
> and select H2D doorbells based on the firmware DAR flag.
>
> In MSI mode, firmware can clear the mailbox interrupt status before the
> host reads it. Requiring a nonzero status can therefore discard valid
> interrupts. Process ring events without that requirement when MSI is
> enabled. Use release/acquire ordering on irq_ready to publish the
> initialized rings before the interrupt thread accesses them.
>

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend

> Signed-off-by: Hector Martin <marcan@marcan.st>
> Co-developed-by: Michael Reeves <michael.reeves077@gmail.com>
> Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
> ---
>  .../wireless/broadcom/brcm80211/brcmfmac/chip.c    |  35 +++-
>  .../wireless/broadcom/brcm80211/brcmfmac/pcie.c    | 197 ++++++++++++++++-----
>  .../broadcom/brcm80211/include/chipcommon.h        |   5 +
>  3 files changed, 183 insertions(+), 54 deletions(-)
