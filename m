Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793714352;
	b=OdpYocdpTAQzoOOAtumHdXsPSDISfW5Qt0UHeyYsjBDBReObuR1NWArxqqL/QrcDchAd
	 4/PbKeF+sZp8cWg+6wetFIp0myiXGZUOubiKPILz99OQOtuLrh729dp+9G64icnP9Ov8s
	 tOdh3XrrywVw0Ug4kKceAe+6/dQ6YbwhAc/jUHOiRuxxWOQJ53r09PQJvlJ08fbeL62qX
	 pX0lsnWFWVsYR80kEV2hFRVEyQHZfk3i3OumissccYVV4earfcvrGmfTYlPQJ2GnM9yC/
	 GtAjj/pTOLt6DlrF0VEb1KpGJ6WQXX/Qn0Q3UHTSKWAAo37ZGKn3GZwE0CpHEvk8NLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714352;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=ccP5HEXTeJ0Y3jbzqMoy8v3yamoeB3mTuClgVh9AD5I=;
	b=D/vWdo41jBIOHrcwMn+Qzwo7/SKSG1S4UinFIn12eD01GwKWKcL//tVf8mDdijdXT6dQ
	 leOYAmWoQnmNNtAt903f6Po66ei9MGV7qKXlG4QTRKJLwDQ6HWB5tYitkQnDrY6LK87uW
	 eKghCUSz4PaZX0zJTyGoJO3MZXDdtoqEKzQiES8KggDb6+TGk22l/hA1iW7Sdk2yhpZsU
	 xK2YVKY3OEcqhm+GI6cemwA3NcpnElLIRkmzxCgQdarhxBmCDMlFA2xTChjssU2og8g2L
	 x9VJcBYCnUKNGHYq8+ytpDx89sZ38KtJ4UYp+pns2+uaDCmSx2Yf0Zt2JJoyi+v6zXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="Fw/O1Fi2";
	arc=none smtp.remote-ip=209.85.215.225
Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6C0606D80F
	for <asahi@lists.linux.dev>; Tue,  3 Nov 2026 13:59:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED6C0606D80F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Fw/O1Fi2
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-cdb1199bfd8so1330305a12.1
        for <asahi@lists.linux.dev>; Tue, 03 Nov 2026 05:59:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793714351; x=1794319151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ccP5HEXTeJ0Y3jbzqMoy8v3yamoeB3mTuClgVh9AD5I=;
        b=CTGO+omyDRue2DFRAoCqoPIBG9A/2qVoASgN4nYOZ8Trzso66eUlT2Eo5EkaRlYn7v
         3P/zLCV6+KxBPGwa6zDGUKGkEQ8NoP5rjtQ2XCBlO0CcA6jqT4bVjGEWe3R3p+f5W19V
         Nzv2FFpSwUcODj9/XLiuCqkQ2h1BzNW0tOwV042w/rtLKQTfOjcwxMfqFXpGVfLp4XPf
         YqbwRnGLxE1EBQIB9cnagGvXMzz26qVEvliclTOkuAEsQjYr8Hb/bxnwKzB9nCH9NqxX
         jCjqKAL5NtBEHmpMpGI0iJ6XYFLOIp3Oe26P3XlCsrUFfJIU5lwnUOdTDAm4Z6PXhpc4
         vksQ==
X-Forwarded-Encrypted: i=1; AKwUvBzaDeSeALrprBrHTznKblkRkQGtLmC+o/DJ3KiYcdK3o378SioZRLCijizHsde0w5DvaTfTcQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z9QJL5ABhqmuZk8uCVfbBSo/VQSyuTbZJbtpWtSbmfPrkgY673N
	lXwzrwuE8a9V1I1F9zt21opvT4PnJaCKTDUm0w3vMI2nkmEtIdKJd9aPQwGd2L08y3NX+uge2VZ
	xiZzriXugWSARHs2aWOcH1I5BsVzaSVNf5BGVaTbLStPY893tQmInjm5a1xREVUGuEmaxiOchux
	bOu+g9t9TidfXCJb7CqCJuPpiCJht6dA6vgQrdv8zbecfS++D8OL3PMYw5zLh8NdtjJZejhdPMp
	o6CEjrQvyEd+Aa1
X-Gm-Gg: AYBFou0BykaEqcrJyHVdQNbN/Jb5egrZZVrPn6iDYP30pa6XPz2Q9th3RGl8l+dy7qk
	GVqmGGEUluZKwkaDyQ6eHexGcst1NzjIyVpxnhTp5mPi6i0Z/k5elefahtqP1XdTJYSQCtebf3P
	SocT9uDcCz5finAaD5EQKGai+OOgCUrbxmdx9EPA3SChKqM2TSqlVXhe7D0Q/RnOrHldw488d2m
	lsi4lcE+3WvhIJsn0b0Gj7d8nNTLMdOL9iQuZo+jSR8/VC1JCjDQseICQotfqkDBtz+Fe0pCpqg
	CIODpohl3jAmCDU8JhjtYSMxBJv2mnI7KVR7V0DgtpucnltsVdMcXUiFRmZgpexNzUA7ytverbh
	Tg6F3fHiMxKipEiOx5vr64/w3BRnbFBJoZjQRz57dyL92gsrIi1hgLuJpTMx0OAQG2O1n9yNthg
	h8BP77vdyxY7lL5d7OxhS8NftpJaZdhF8wPFCIVb8=
X-Received: by 2002:a17:90b:5686:b0:3a4:9a7a:360 with SMTP id 98e67ed59e1d1-3ae897f6e7cmr10870413a91.29.1793714351271;
        Tue, 03 Nov 2026 05:59:11 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae87dc5982sm4273111a91.2.2026.11.03.05.59.10
        for <asahi@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Nov 2026 05:59:11 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-14373747468so5533842c88.1
        for <asahi@lists.linux.dev>; Tue, 03 Nov 2026 05:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793714349; x=1794319149; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ccP5HEXTeJ0Y3jbzqMoy8v3yamoeB3mTuClgVh9AD5I=;
        b=Fw/O1Fi2ESlWYRqPBOXJPPXud+P1FXcfYQAkLwCMYFir5zXONCz52n8/v/e5hpta9w
         U8k0nEJfhkI1jedPofPA7urLnD7KMpAISuhycIPrhzgIjhGa/HTQQZ0VdY/dvWbrTy8L
         COCWclQDf+p5VmZbQ5+s8Ybns0T3LzEJElC8E=
X-Forwarded-Encrypted: i=1; AKwUvBypAvOOk/0I8X5bFUd9StK0QICpj6p17jc5MF/73fQn874E5Gvr/hRcHW98wNaOT0nA5SpvwA==@lists.linux.dev
X-Received: by 2002:a05:701b:2702:b0:143:5cb4:30 with SMTP id a92af1059eb24-1ac5577508cmr18346091c88.3.1793714348707;
        Tue, 03 Nov 2026 05:59:08 -0800 (PST)
X-Received: by 2002:a05:701b:2702:b0:143:5cb4:30 with SMTP id a92af1059eb24-1ac5577508cmr18346046c88.3.1793714347953;
        Tue, 03 Nov 2026 05:59:07 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac18458e07sm41658755c88.8.2026.11.03.05.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:59:07 -0800 (PST)
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
Subject: Re: [PATCH 01/13] wifi: brcmfmac: pcie: Report the detected chip ID to the bus
Date: Tue,  3 Nov 2026 14:58:45 +0100
Message-ID: <20261103135856.3676311-2-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260925-brcm4388-submit-v1-1-b5cbc2cde2fb@gmail.com>
References: <20260925-brcm4388-submit-v1-1-b5cbc2cde2fb@gmail.com>
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

On Fri, 25 Sep 2026 23:43:36 +1000, Michael Reeves <michael.reeves077@gmail.com> wrote:
> From: Michael Reeves <michael.reeves077@gmail.com>
>
> The devinfo->coreid field is never assigned, so bus->chip remains zero
> and chip-specific feature checks cannot match. Assign bus->chip from
> devinfo->ci->chip, which contains the detected chip ID.
>

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend

> Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
