Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793714390;
	b=dAsqVoETyVJzLGCZLuCMDphOdccbjmDBdF/dpyI9XN6aF2NygxXlncGV+iSJYQcD7sp4
	 4vNGoEbo8dJ5BqfcrLb3dJ+MVH2DGmeB/Cghw5iOLlUSirHwWgijxi2iGcP/svnIDiyyf
	 I8cWSH38l/14D4HTllr1e5luQ0JQPUB691atV8PMLZALUId0+LuYIuFEBsC6o3DWMb/z3
	 kIvR+KLLrqirvPB9XtHaTykIdkD/HqOaVp8N40RpcJ1eC678DUrz9+L55ItOtaoooHcSm
	 Rwt8Rrb0bv2Q0/9W6KEo7ARdGsBfbdZIDH3t1npGF19Whp1BxOnt8C8slCoUJq9wUsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714390;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=BPfwhnSKhhImT2MSjvVFfyGTbJZ+CXv0gKlK5lwoVaI=;
	b=h8nSH2lKvnZ4n1pOXeeJjpbUYFGAdmwJcKsN8l6v4ruurDp2Ka6DBG0guV9ESv+TmVBY
	 StUZdYuXgFd8PexpnqsPv27qlkkqw0/ieMIu7vLoFcz1aEX4spFd59NabU/xF2oVIJ6y+
	 UWtKtMlJyqqW7VLk1THADsbTvAGre0CysmK24Y6VhZaj1YDoTOJrQuVzV1hsDiNjHOmWX
	 r90pw7kHqqATA6YNnmYNrzZaRgAc4XN1ipjh4RgPjrfzmHjgS+oOfaNweAFG9K/RCpgfG
	 BGPYyyb/YIm/OXS38IJfL9REZkQIidHZTSMIBEumvVz2TJow7hnLshwV9WGSrxXoP8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=VNdlWMY1;
	arc=none smtp.remote-ip=74.125.224.99
Received: from mail-yx1-f99.google.com (mail-yx1-f99.google.com [74.125.224.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D91606D812
	for <asahi@lists.linux.dev>; Tue,  3 Nov 2026 13:59:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10D91606D812
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=VNdlWMY1
Received: by mail-yx1-f99.google.com with SMTP id 956f58d0204a3-67989a2f9bfso2846299d50.3
        for <asahi@lists.linux.dev>; Tue, 03 Nov 2026 05:59:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793714389; x=1794319189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BPfwhnSKhhImT2MSjvVFfyGTbJZ+CXv0gKlK5lwoVaI=;
        b=FZ0VIU9OUk9x5xR+D/aIc3lOMRlRqrHsJGlPZBuikEkCGY5/7e/eiOT+SOai98Fpa1
         vRaO5/Y+lI55OB8898MlBYlWCpQdHnJniiLqE8+zl3e76TsIqNxvLK0tysqLBW5hd6Cs
         u1iPZ9Vuk+Yw/NYFP6N6J1XcaYemu6CmOZnIocxTlEDiyXR5IUj/NWF5o2xa9OrnlSb1
         bRnai7WFRLhI78posQU7oX5r4k2BQ3jadhV9LWr+X+lYWOS0ab0xEjGpK340zQs1/6MJ
         5c17mlQpe+ul1EnzFx9RxpcVy22m0LTBT4eMI7m+ld8DGxPo0gN6xmcQfJ49gdVCp4EU
         VKZw==
X-Forwarded-Encrypted: i=1; AKwUvBzIWQe8VHo38/8qoUL5fFv00rdnK9nR3QIb8LatvWSstFBqKQQ6HX5U8GoVZ7QvN+uLyHrTzQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z+uRzEtwfU3t1sMsmwCWR1PFvhJEHg0DdgANY30HNNVc6UgQVvD
	M37Mt8tXkKTfk4xwjqKWLiVmUX9EaKj7HF0wfJZq/RSV0jiIpW0UZhQUmp8RGTXNaKuLsvmNfxQ
	SwhTEtnxGEp3/d4xOnNqVwgP08a0q/D2DEPCrrHrazd/JOLgxXrEYoNeUSYyTYbvFEAn+UIXMSL
	Ep9aPwmrJOqxyvtTIRmxovw1lrQRCVfCeJNPlsPYMLZw82PgxPOfD4i3j3SxiRC9q3nKn3un3QG
	oVeG33CU4+bIeK0
X-Gm-Gg: AYBFou38xjOAn47DOickn1drdiXqJ+KkeoZgbqOSd+HL1WsnL+0fPUw31xqn6iaGPgS
	Qvb/mtYOm7eztGT3hpunaoc0YSMMpzQwsUC7zmWpHUQHT9UGR6WaUJPGo4Da6nanGUqz8Cn2HH7
	puE7Hieo8rvrt49O5QVjKThyckLdX4Cofkj0qgeak6XVxPSyiPlIzKqcAhXuBc9RVLkDz5ol+LY
	L0o0zgQGh88PXcl46tuOtUXOirElSgYbKlnCb+wSlv54WHh1mDITovwpor+BVzamTW4mIZAJv+A
	YJUV+/XEGhuqbKALc9UahgybNdJ5zEFj2EC9Kfwt/euzPcv2bQKuh04S20+79VKpuLcfEO682W0
	tUJnOK8J7RuQYxQIjwn0SOXYG+2nFptvQx5qO0Uet7weHOJ2hGKxQiMnfLnSc3nAwfsLE2d0742
	Wcpv5RDDGyKWSxhcjqYPulgMZ+7uzJqm4rzsGYKHw=
X-Received: by 2002:a05:690e:4847:b0:679:bc19:9f24 with SMTP id 956f58d0204a3-67ba4fd7e90mr5517087d50.67.1793714388871;
        Tue, 03 Nov 2026 05:59:48 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 956f58d0204a3-67baf31cb50sm111957d50.30.2026.11.03.05.59.48
        for <asahi@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Nov 2026 05:59:48 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-359b81ad4e8so5532691eec.0
        for <asahi@lists.linux.dev>; Tue, 03 Nov 2026 05:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793714387; x=1794319187; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BPfwhnSKhhImT2MSjvVFfyGTbJZ+CXv0gKlK5lwoVaI=;
        b=VNdlWMY1OV6euCnF0Lqi+vDdTwT7xi++wHv8rWtcfdaaORgd4CXN/6i6ymJuUzZW0n
         DmlsL+Hj7GOwHTUfVpBhFWVM0rtfXsGcJhUBSKQ8cZHnaWbmEcUMjhnH2v0WCNzu9CNS
         jcGuwnGgMztdMD0DLpo08DGY+O20PRwvNTraU=
X-Forwarded-Encrypted: i=1; AKwUvBzWzcaWuUM+QvPMMsOYJPxjB3ZAxPcSyleJqxMagCFlTSUBJeGuPB01jYlC/0EEkzLBAGssxQ==@lists.linux.dev
X-Received: by 2002:a05:7022:b059:20b0:1ad:3402:733f with SMTP id a92af1059eb24-1ad3420f9a1mr19288277c88.44.1793714387405;
        Tue, 03 Nov 2026 05:59:47 -0800 (PST)
X-Received: by 2002:a05:7022:b059:20b0:1ad:3402:733f with SMTP id a92af1059eb24-1ad3420f9a1mr19288228c88.44.1793714386672;
        Tue, 03 Nov 2026 05:59:46 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac18458e07sm41658755c88.8.2026.11.03.05.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:59:46 -0800 (PST)
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
Subject: Re: [PATCH 06/13] wifi: brcmfmac: Load signed PCIe firmware images
Date: Tue,  3 Nov 2026 14:58:53 +0100
Message-ID: <20261103135856.3676311-10-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260925-brcm4388-submit-v1-6-b5cbc2cde2fb@gmail.com>
References: <20260925-brcm4388-submit-v1-6-b5cbc2cde2fb@gmail.com>
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

On Fri, 25 Sep 2026 23:43:41 +1000, Michael Reeves <michael.reeves077@gmail.com> wrote:
> From: Hector Martin <marcan@marcan.st>
>
> Signed PCIe firmware needs a signature and a memory map describing the
> image, signature, verification status, and bootloader heap.
>
> Request an optional .sig file and write the signature and reverse-TLV
> metadata to device memory. Describe an aligned heap after the firmware
> image, keeping the metadata and end footer outside it. Require NVRAM for
> signed images and preserve their reset vector.
>
> Request the IRQ before starting firmware on chips that use signatures,
> while keeping ring processing disabled until initialization completes.
>

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend

> Signed-off-by: Hector Martin <marcan@marcan.st>
> Co-developed-by: Daniel Berlin <dberlin@dberlin.org>
> Signed-off-by: Daniel Berlin <dberlin@dberlin.org>
> Co-developed-by: Michael Reeves <michael.reeves077@gmail.com>
> Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
> ---
>  .../wireless/broadcom/brcm80211/brcmfmac/pcie.c    | 267 ++++++++++++++++++---
>  1 file changed, 233 insertions(+), 34 deletions(-)
