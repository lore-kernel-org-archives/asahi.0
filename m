Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793714395;
	b=3LSSzJ9Px9ViSVETCUDH/qivUXdFrrsMbARG5J6ctKUJ5/XqE5nxWdQxeMr7lXuxpLBo
	 H6xUYBx10kZHgCa+75XlQwq4MuldhlHa/l0ed9DHl5dHqI1b9Nyijlo3459d6nTg6+01l
	 YOpYnmw2plarE+V+k3aFuTWl69WaPyHE6TL1a66c8X+E5EURLBTS36W7RPkzwnHXiWRkD
	 HQLjkSFHd4s4L2L8sCPfvFU5dNcTvgOxN/wrw69Ug7x/yd9AWI2aJqe0Q2Eb7jLwNbKVa
	 GwKs4Kw8tLJyU5X6uS/HsN7VNvcP9B2KsvsIcGtfmuoyOgNAJltF/F5bVl9hMG23XxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714395;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=FwIVVnYhvvjMTysTggNf76en9r3AUtCzAUuv63rWer0=;
	b=zf0NLQGX9yMP48YaclN5aG3tODgMZNu/AmG69SXm85uDGQhXaHpY3GUJmUTdl/Gz61iv
	 IYxrDr30RG15r3el9h4PzLk68MicBtL+I1slg3FzPWXQWIRHfOuIVUDeMfGUelf0ebNMS
	 dNDpMTuEeL3Va+OtMYdL+Ge5+7i406mj2y3lM4YVdkbniuO9GcRenowRaSNY6Vt/705we
	 7uugnoLEUHTTx7mI21uInSvmaAnjIac68vBwrZYAjB4IA9fdJCx6TBj5mhd5U/1hhI1CX
	 4qJ6NtJWoIcMQZ307eUa5UxftzoltA6YQu51/J++gro9UfNetbXV4SNXt70G7mh+7HA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=GL9kYdLR;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98F2606D821
	for <asahi@lists.linux.dev>; Tue,  3 Nov 2026 13:59:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C98F2606D821
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=GL9kYdLR
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3ac451e128cso2698627a91.1
        for <asahi@lists.linux.dev>; Tue, 03 Nov 2026 05:59:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793714394; x=1794319194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FwIVVnYhvvjMTysTggNf76en9r3AUtCzAUuv63rWer0=;
        b=xfZe5KgLeUrTTZ0xK/9S969jt2ka/v86+bqqvu4LKpqBazUuN5/w2NL2+Ls9hYgl0J
         2VOPi52AZVpG52UA3XSN6CxEgbN9eRtAAWUGe2JY0RysGzFljbv96PeGX9NaD49rjs3Q
         S9q4ylOTppiw/QmeaNwaf3HFfBkMayUNstACBXq+CPY7ibrg88JwDJJ7b4nsjw+Gp5B+
         hdFrdaDUe+33dRFsDCeP5LIVM9imUgBylzW2/FQpm6rbmvxgXfDsFnP5dKBehkxdhkBG
         r0li1X4WQHc9LBvvkyx6JCsJyNebOS2YuIaJZ7CMx1n5AsvzlWPONmD0J/CHw6LsAnfh
         yPsQ==
X-Forwarded-Encrypted: i=1; AKwUvBxOyvV7RrFFwuNAZc776WgfbZYA3/LPSCSzJ8LSpD8ge5553Ghl8/WRUhLCrviargvbmxtucw==@lists.linux.dev
X-Gm-Message-State: APuU4Z91D2/qhXpYA6aiNnpdjWTJatwODEOXuBVGRqMcTgberpAeiRgW
	IhC0OPprWxsTIvW727KMca7SbF/gSZqoEVhDT1XSPhBKSbe82cZ0ACf84uiOMcjYINdFSxUU30q
	6lDBNp8bRgvyuliKgzLYkqAp+tjpm4slBkIljQE3jU7D79sQb7J4CQTa+S82W709NIINXtu3uts
	5KyMJOLe4ziFAF212tpan8P1dj9mMJye50T/bXX1gV/2dYEMBS7QBytOPnekopwjwwOLOYCrqQC
	qEMYPPImnDLNOSw
X-Gm-Gg: AYBFou0uWKC4eHwewr1jtz20g++oZ+tHke5fjnpEXnvbL81ULu1f6vvkFRzDOLUGfnl
	BtEvMLNerh1VHrBic04wBmWHxkkL83iiSVACfaYDS5IVNf/Ss9Ftj48YX6JJbZcWClEjFnjYecq
	5KhRD+ntD6odtSQSaW2+BIIcpLUJwACqfqL8ULviYpjianAfZ7tYGXcNV3VC3sE4Z8xMMJEx/1Z
	s86xDQqeNtm7WpXcC2Bttv2NdH1I27By7pT8w/vr56NzfoSZFUASK3yP8v6DqIaB9+AZwhLzUJb
	IZmELq1RS/9FHjIBSW/pRDh7l3yqNWeatpygwdE45XmcN1bFdcyOuh4HuBWfYj61aktdAyGh0kb
	kim6X99k0s9K58JsNrlrLF/K6Ec/eFdUcTRKrjNvLfNjHV09kSQnqQMNnoAtJRMj240U5Vk02ht
	TBEI1iuKYreZUvRAAOIEdSIDNS/cVajJxoYa1QD0o=
X-Received: by 2002:a17:90b:2803:b0:3ac:96a3:77d5 with SMTP id 98e67ed59e1d1-3ae897e066bmr8700568a91.36.1793714393953;
        Tue, 03 Nov 2026 05:59:53 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b07c9d77b9sm1902384a91.4.2026.11.03.05.59.53
        for <asahi@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Nov 2026 05:59:53 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1aa0fb7f157so6462987c88.0
        for <asahi@lists.linux.dev>; Tue, 03 Nov 2026 05:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793714392; x=1794319192; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FwIVVnYhvvjMTysTggNf76en9r3AUtCzAUuv63rWer0=;
        b=GL9kYdLR+D04yp/N5aQ3FVdJhZjaGIzFUaPvITs4nfkq9C3/X2xrVg8uRZ57bSPk7K
         qO4WAjHf70mBaJ6dEX5DYY3UrIbt7lqZw4y1jam7LVRW4tjtxTUnMdHPXuKngD0qtsBP
         7Sdk9IsP0w9/EmOzTxWGSILjuNPBuXW01pSTU=
X-Forwarded-Encrypted: i=1; AKwUvBwGfmB7wjq6ujJAA7M7bcsb9SddzM6L25NC822130qadg47LUNlgDzUQCd8jwESg7OuRDkADA==@lists.linux.dev
X-Received: by 2002:a05:7023:a56:20b0:1b2:3742:828e with SMTP id a92af1059eb24-1b23742830emr5949721c88.3.1793714392078;
        Tue, 03 Nov 2026 05:59:52 -0800 (PST)
X-Received: by 2002:a05:7023:a56:20b0:1b2:3742:828e with SMTP id a92af1059eb24-1b23742830emr5949684c88.3.1793714391367;
        Tue, 03 Nov 2026 05:59:51 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac18458e07sm41658755c88.8.2026.11.03.05.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:59:50 -0800 (PST)
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
Subject: Re: [PATCH 13/13] wifi: brcmfmac: Add BCM4388 support
Date: Tue,  3 Nov 2026 14:58:54 +0100
Message-ID: <20261103135856.3676311-11-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260925-brcm4388-submit-v1-13-b5cbc2cde2fb@gmail.com>
References: <20260925-brcm4388-submit-v1-13-b5cbc2cde2fb@gmail.com>
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

On Fri, 25 Sep 2026 23:43:48 +1000, Michael Reeves <michael.reeves077@gmail.com> wrote:
> From: Hector Martin <marcan@marcan.st>
>
> Add BCM4388 firmware mappings, RAM base and OTP handling, and increase
> the RX posting and completion ring capacities to 2048 items.
>
> On BCM4388, DMA_FROM_DEVICE mappings for posted receive buffers cause
> DART read-permission faults followed by firmware DMA failure. Map these
> buffers with DMA_BIDIRECTIONAL to allow device reads as well as writes.
> Keep the existing mapping direction for other chips.
>

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend

> Signed-off-by: Hector Martin <marcan@marcan.st>
> Co-developed-by: Michael Reeves <michael.reeves077@gmail.com>
> Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/chip.c      |  1 +
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.c    |  8 +++++---
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.h    |  4 ++--
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c      | 12 +++++++++++-
>  .../net/wireless/broadcom/brcm80211/include/brcm_hw_ids.h    |  2 ++
>  5 files changed, 21 insertions(+), 6 deletions(-)
