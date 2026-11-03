Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793714380;
	b=bRj+ChlnfzZQwR6fe5laGR4lhH8OshO9I+Zs0ws6xm+cbgBVveM19XCbES8f/bkp120v
	 F4NrAdDZjZnWChyZm//i0cKHq/NroR4kJTQ+4IRk+wPeZZZ7kR3n0EZQ0zDPsUfdwTDst
	 9XctEvqbsLxGAytwEPy62R6nqxmmSpJv+VsfLtorSxIgnq7L7aDCgdSzZ/AHXGlEDuIdw
	 qGPpcp5BkAxdR+I791nnFHaGYBVWsIRv1ZJY8FkOI1P255Z1KvoJb/JuUzDoz1gyiBRKa
	 zNxN3uEELzWYpoXRrEikwCxeV1Vq6/+CcO2ANQorOG1Jx+H+kAP4AYHiZ8OImBzxHvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714380;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=MKbHGKv5YTUZyLi0eTwdWhkz8iHCBkMeD/Uh/c0x5O8=;
	b=aaW2ojEcWBjlb0qjlAHb2pBOya4ljselrgv9h5fS6k1SNXjMooGKW0rpOiAxpbz8xBUG
	 bUCQsU130FHgUvgDJsB/k9lxEX/8WGR2VD94eEWxn7h727asZ7xGUwmqmeg8Dt7p1FX5b
	 sm9zJPqDOGG81Pyof2IvHGP8q+1UP2iepPSNqgtEywuTM8mBY8yMpveH4eUh6AGKJT4qB
	 KNO15TeQdQEAqjckR3qiNl4yLb8hSO+MPm/iB8+Mns96bm+xsubuoOApDA8Kz6sn6Otyj
	 +9t9X0jQekCsYKuLo57C1sATqJIrzNIoLRxUpbuvXDk4D2BmPooht1ejRF73sOvacyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="HI/b1qPu";
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343F76082BD6
	for <asahi@lists.linux.dev>; Tue,  3 Nov 2026 13:59:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 343F76082BD6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=HI/b1qPu
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3ad2b3b1c02so2300381a91.1
        for <asahi@lists.linux.dev>; Tue, 03 Nov 2026 05:59:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793714379; x=1794319179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MKbHGKv5YTUZyLi0eTwdWhkz8iHCBkMeD/Uh/c0x5O8=;
        b=y6gDJfsEnpm5bpkty/Mp78pT6a5v5F+VHwFiUxW29+lnvdWH94GfXDFCwlpdvzMTyE
         hLBuVDoqJPQ0Qy2dUY62i5dN4mxx1/h1MpTagvEZkCjqnQyKIM/YxFyJ8Xe9FjSgVqGe
         YvE3Zqtngh01KNw6WuVOraz8Nan9r84cXG0WB+yoaYKjCGiuT5V4nC8SUCqgXS0iL+8Y
         kgKs4/J8l801c1uI4SjG65IhwYLNtKznA7TVhXUHEPseuEDZitHbiIwdYbL/T26cbkG7
         wkyEsuAeRwymUjLjnVuKkV0VCXfOEgk4uaP0hlfNgxBg6m4BJGEoSnXFnbJyZayBARzk
         W0fw==
X-Forwarded-Encrypted: i=1; AKwUvBzQH0e5l5nVrtoeoGuDbez1T1kvfc5flrwJB3kSuZaTegVMrtLf8eAzowL+FDSlE5xWz8W6Vg==@lists.linux.dev
X-Gm-Message-State: APuU4Z97z7a8OpvtSolNAnTjosqWuBK4XL5RbM6KRxhfPXTkhadsV294
	BT0rVuh4StCD8rWwJ4WhcVDDCoo+3Z61zWNx0ouMqw/c2sNNutgEJzo5nvwU0bOQhXDqF8RH28l
	w3fzcNtadB9Jx8jMOqfAa4ZgjNj32ICue9cpWWDDaX0+q55FWo9HXRC2Ry4ruMIoDcrZLkQZGIS
	NtNCxkdMQ4GJrA3Di4n41nuGFcdFLEj/ckGOyDkaZHCTEp0gr1zdpz4oOIaZHy7tzzFN7B2y000
	Ksc0S4WHAJyMDMR
X-Gm-Gg: AYBFou2fk4M83raCmxOHO9o5h3LsAeIk8hwFoveTlNLt+DHEhvzRqXla9MEH7CCUXmE
	4BeVVta1oMGQ4+GGAvW0RPwsuCSjSZzQwUqhQ0EG8EnfFF93eW0aZw+r8PJsoiQ3zwN8wFMmJ9X
	NGlH1zypz9uBR6i1tq7GxyxQ49uzuPnqwh+mbyevOg2zwyyvpUwHkOAj2ejnXEo3VmOQ3v3eWOk
	lwA35kyZQy6cMyNkz+0Qp2Og7Za8e4jXecORJG330w6YqodP2GkE8yxtMDHnbfr0jJOA3thtBnx
	TKxfVgi2PfrbHU7lNT9L8Zak1losQCM0NI+kqHkv8YxbwQyIWRrbi2SAdgQPlL2jzjTsSgMcdWy
	k1yyfJ1ZfOHv30mh9zARwwJbgtGXl1h9QgckuNg3V79In5RPBQtIQptBSVsYUtYixeyurES0d8l
	+QA0FSGV9PeEEKcbTAzlzVW+PDpxtgIRb5sIcB0bI=
X-Received: by 2002:a17:90b:4f84:b0:3ab:e588:c275 with SMTP id 98e67ed59e1d1-3ae897ccd23mr9748608a91.20.1793714379458;
        Tue, 03 Nov 2026 05:59:39 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b07c7aa9c6sm1921280a91.1.2026.11.03.05.59.38
        for <asahi@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Nov 2026 05:59:39 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1acbaf81bebso894101c88.1
        for <asahi@lists.linux.dev>; Tue, 03 Nov 2026 05:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793714377; x=1794319177; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MKbHGKv5YTUZyLi0eTwdWhkz8iHCBkMeD/Uh/c0x5O8=;
        b=HI/b1qPujPrtFBMaZ6TaPlfUENgx2EUy3DgPvvxYySqd/pUCE9pRXnElprQFdyol4J
         l/MLocI9XuU2imD7lpzjk9rNrRygtTbrfFHT4MUbsMkmqNri6EsE143SH+BeHVMqemka
         foj8e99F85/9Z8gCUp/NsH81UEzCfD+lL4Jic=
X-Forwarded-Encrypted: i=1; AKwUvBxsH0mnqg21vGh6OO7E9mTNY+YWIKbCsdCnbrJMI+zTsRAB/3YEvWQk4nnS6K0vtU0REFD6Ng==@lists.linux.dev
X-Received: by 2002:a05:7022:2581:b0:1a8:7b58:6f1b with SMTP id a92af1059eb24-1ac5cfe587cmr24855345c88.19.1793714377479;
        Tue, 03 Nov 2026 05:59:37 -0800 (PST)
X-Received: by 2002:a05:7022:2581:b0:1a8:7b58:6f1b with SMTP id a92af1059eb24-1ac5cfe587cmr24855289c88.19.1793714376827;
        Tue, 03 Nov 2026 05:59:36 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac18458e07sm41658755c88.8.2026.11.03.05.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:59:36 -0800 (PST)
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
Subject: Re: [PATCH 10/13] wifi: brcmfmac: Support versioned scan parameter layouts
Date: Tue,  3 Nov 2026 14:58:51 +0100
Message-ID: <20261103135856.3676311-8-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260925-brcm4388-submit-v1-10-b5cbc2cde2fb@gmail.com>
References: <20260925-brcm4388-submit-v1-10-b5cbc2cde2fb@gmail.com>
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

On Fri, 25 Sep 2026 23:43:45 +1000, Michael Reeves <michael.reeves077@gmail.com> wrote:
> From: Daniel Berlin <dberlin@dberlin.org>
>
> Newer firmware uses scan parameter layouts with version headers, wider
> scan flags, and additional fields. Requests must match the layout
> expected by firmware.
>
> Select builders for versions 1 through 4 from the scan_ver response and
> use the selected layout for both scan requests and aborts. Fall back to
> version 1 when version discovery is unavailable.
>

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend

> Signed-off-by: Daniel Berlin <dberlin@dberlin.org>
> Co-developed-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Co-developed-by: Michael Reeves <michael.reeves077@gmail.com>
> Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
> ---
>  .../wireless/broadcom/brcm80211/brcmfmac/Makefile  |   1 +
>  .../broadcom/brcm80211/brcmfmac/cfg80211.c         | 203 ++--------
>  .../wireless/broadcom/brcm80211/brcmfmac/core.h    |  17 +
>  .../wireless/broadcom/brcm80211/brcmfmac/feature.c |  46 ++-
>  .../broadcom/brcm80211/brcmfmac/fwil_types.h       |  65 ++++
>  .../broadcom/brcm80211/brcmfmac/scan_param.c       | 416 +++++++++++++++++++++
>  .../broadcom/brcm80211/brcmfmac/scan_param.h       |  13 +
>  7 files changed, 594 insertions(+), 167 deletions(-)
