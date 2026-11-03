Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793714387;
	b=YBLYB5p8YYTd8eYLxYVBG7i/TW0qJYSbPQmmNvfmK7qdsnTLKX7Iuus52ZlTafepV2bd
	 EVElYNFI9ClNdPdCHhHghjRmIK4fBaV8SsPnt8KqQy5mIDgzFIV1kCL2IoEe3cliI/teL
	 ZY/B4y6rkrfIiGkT4gLtK+bbl0xdsdF2ypS6Qt3SSD/8adeE58sq8qgQzXGf+QF1vQj4Z
	 vVi2ehguSyuc35gPofEna136YamZMpa8HdIGJH7hBO5FRL167t4SMYFdmsArWb7Nqzd2+
	 BeWSoh81bidZQRUwT6WucvVAU8zcmQFjIK7whYCo7ORMN7IenDthTpTBcG8gRE2cv6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714387;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=TR67u4JxnjJub76U3ECbURlUoxwJMuJHoq+jVOWi5Uc=;
	b=xmpBRkOXw/ubtEkChKyF3jAjCcI36v5fBXaEIZlBmNYiQfNsRO0xB0rg+sDLqH/8VDoT
	 l/nAbvi+IGGMB+eOB4kNU9vQtvzADcu7l81Zcies/ZXu4V/zc3Dxl4WFlr3u+5PNRaszh
	 8r6EYxO8sLsqZHHRtqnGpCX2gyhNb0WDJHOz1f/YVb1PIERdPEbGtmq0kyjhMPVaHWMqj
	 vAYkFu37IHOQx1UbdduLoJFCQzxtF+GA5MzcJjkXkBFj2iKNXBBCEHu8Fu0aeSh4Hgwb4
	 8aSIOWk6kqCZIMkY6AjYBgy4z6717Ggtwdg77NjGt4LhLA2g8SxebyWv4swLu3qMVEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Uipi7eEs;
	arc=none smtp.remote-ip=209.85.161.99
Received: from mail-oo1-f99.google.com (mail-oo1-f99.google.com [209.85.161.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940F7606A32F
	for <asahi@lists.linux.dev>; Tue,  3 Nov 2026 13:59:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 940F7606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Uipi7eEs
Received: by mail-oo1-f99.google.com with SMTP id 006d021491bc7-6d290b10a35so1752912eaf.2
        for <asahi@lists.linux.dev>; Tue, 03 Nov 2026 05:59:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793714385; x=1794319185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TR67u4JxnjJub76U3ECbURlUoxwJMuJHoq+jVOWi5Uc=;
        b=NvwLIF4UizPqoMemkUm+6Wy+x/3Vmu3REx5RW/1XP/LTOR/GrOa5kjkg5pS29zlUzZ
         v1viKTvnixD642JkUK2t6LSqLkrN4ZWLtoCC972HLJo2W3+TBcSK0wEzJXsIu8mU3bkg
         B96wSREewodA8KMy2cs3RPSBC12WN9wEJ8B68N8t1Nk9hu2gztG07ma3zIcbiolNAoWR
         5PyJQiA7BXW0VhrdMeXerUxZNtDAg1umcHHVrNkxAWr3fZUDFGlG/0WaogpTdnBk6NpP
         AQnsQ66kj54EdFjcpTOptcnpyY3EpxaPZ43GcFtmXdxbCnZDnVPbhNBEadr+A3Pab291
         DjzQ==
X-Forwarded-Encrypted: i=1; AKwUvBwJphcudCfTfWsk7phICtdRo0MWp46mVi3ifBVfUvTPwTuL5nfV+pB5JDeKqq64LVkYb/8xRw==@lists.linux.dev
X-Gm-Message-State: APuU4Z8qKV3Un3lUljr964vvyLWsXXdKgr5xGWBEVrURUYc1d3G/gZPC
	xFHWaDgoAg8BChFjfKRhOnjGoOF+vtY3YtXRBY8Iw5gV2rPH5gYCrubwxKq1kdeEVErEHJc3i/9
	IozrgTj09aB94pXnFrZ5rxDiwt9Omy0/3ZU14AjXHDPAXomdwXRJT3sPJCc4vuzRRSvWmc+jRt1
	q3dQodiycXCk1tpzbfNX1Eb4aXjGuaWox0++AGjnHF/kZVW6V1g+uG0pjTyZ+0MZm5xzlY1fgx+
	2gxCIq6Dyilc4EI
X-Gm-Gg: AYBFou2uwWSBRnWpOWoAmBk/XQjbF0j9xOUPnvG/ZhYRK7nhJWeqEX2KUyvMG+h6RPL
	jhYtLCpe8O6UbmiPS/bxlbjqFGj1OzVcTwSutYh8lYsHh7Lg7Up2fjPl1rBuTk52MTwkVkLNv2y
	Rj1k2qajuIECPYp/PKHAnvLeo5FOT9TVx64hWmCLhkr4ykT55EdtRypBSjMzMHu+cHwWd4cEB9p
	zi+R+SzUagJU4YPsmM6esjGVN1pw88HqCKlbxwe6Zfx1WyfBOVBLH542cJ3nXqfDDul12lQYquz
	2exEmS4IiWVYII8Wrs+kO+LcUCHY86T5CEYz8okHoduQHtel4bTwPOSx7gdTidtsZlwnH2h+U2s
	M4dPPs6rgHL8ol+AUvURy7CRPJuWvnt04LGGiKaeT2eLyOH69TJDKHICanFgXvGJUpQQynz//jf
	MHmNLyE84O8ob+Akpi6KjraddpNGYT2dUhW5nEHDM=
X-Received: by 2002:a05:6820:169e:b0:6f4:d9d4:3948 with SMTP id 006d021491bc7-714f29c8b65mr6820422eaf.45.1793714385462;
        Tue, 03 Nov 2026 05:59:45 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 006d021491bc7-714f2c9e97dsm106879eaf.3.2026.11.03.05.59.44
        for <asahi@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Nov 2026 05:59:45 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-16bc6f3fdb1so4029524c88.0
        for <asahi@lists.linux.dev>; Tue, 03 Nov 2026 05:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793714383; x=1794319183; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TR67u4JxnjJub76U3ECbURlUoxwJMuJHoq+jVOWi5Uc=;
        b=Uipi7eEsraJGVdDE6KjLCZSZaUjxjPuL6qpjh7UBtxpZh71HtUeZu2fKY8OO2IadMC
         5TAkbDLyg8EbO/dbGmzldbQUS88UW6Bb7WcrJxg2Ck5Uy9ducSvi/JG5BCGbIA1a5i77
         St2TucVI+OuxC4dSfvOrieeW19GlL3dXhmH64=
X-Forwarded-Encrypted: i=1; AKwUvBw82KENlJZJOtB/vxlfuq0WeA1sfc1A5v7cMm1J3dJId5n74192loD+GPZfbO+267y9K4h/pA==@lists.linux.dev
X-Received: by 2002:a05:7022:ea56:10b0:176:a225:e364 with SMTP id a92af1059eb24-1ac5de547afmr19489915c88.35.1793714382876;
        Tue, 03 Nov 2026 05:59:42 -0800 (PST)
X-Received: by 2002:a05:7022:ea56:10b0:176:a225:e364 with SMTP id a92af1059eb24-1ac5de547afmr19489867c88.35.1793714382225;
        Tue, 03 Nov 2026 05:59:42 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac18458e07sm41658755c88.8.2026.11.03.05.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:59:40 -0800 (PST)
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
Subject: Re: [PATCH 07/13] wifi: brcmfmac: Use event_msgs_ext for event masks
Date: Tue,  3 Nov 2026 14:58:52 +0100
Message-ID: <20261103135856.3676311-9-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260925-brcm4388-submit-v1-7-b5cbc2cde2fb@gmail.com>
References: <20260925-brcm4388-submit-v1-7-b5cbc2cde2fb@gmail.com>
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

On Fri, 25 Sep 2026 23:43:42 +1000, Michael Reeves <michael.reeves077@gmail.com> wrote:
> From: Michael Reeves <michael.reeves077@gmail.com>
>
> BCM4388 firmware rejects the legacy event_msgs query during preinit but
> supports the structured event_msgs_ext command.
>
> Probe event_msgs_ext during feature detection and initialize the event
> mask after feature flags are set. Use the extended command when
> supported and retain the legacy path otherwise.
>

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend

> Co-developed-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
> ---
>  .../wireless/broadcom/brcm80211/brcmfmac/common.c  |  23 ----
>  .../wireless/broadcom/brcm80211/brcmfmac/core.c    |   5 +-
>  .../wireless/broadcom/brcm80211/brcmfmac/feature.c |  39 +++++++
>  .../wireless/broadcom/brcm80211/brcmfmac/feature.h |   2 +
>  .../wireless/broadcom/brcm80211/brcmfmac/fweh.c    | 130 ++++++++++++++++++++-
>  .../wireless/broadcom/brcm80211/brcmfmac/fweh.h    |   1 +
>  .../broadcom/brcm80211/brcmfmac/fwil_types.h       |  26 +++++
>  7 files changed, 199 insertions(+), 27 deletions(-)
