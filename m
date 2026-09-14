Received: from mail-pl1-f226.google.com (mail-pl1-f226.google.com [209.85.214.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D2149DB87
	for <asahi@lists.linux.dev>; Mon, 14 Sep 2026 20:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789416298; cv=none; b=toMJh/zBBC/WgL2nDbSM9fCppNCzweZNCrQV2TUt7C5P9MpQBShqNHsiD8H0dx7phNY3YfX3/cSeYqqdolRF1xQ7h7ony/nYsh/u6yYHGuO05A6PigB+s6J/+pmUTeOH/K2k8TaPgIgizudznyAR1iHWgTkaOy71tgUdOkfxHEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789416298; c=relaxed/simple;
	bh=vQ5BcgY5sdG1CQBpmPGsw0919m9BDRY1Jb3LHemijU8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VeUo5UaRv0hLAOjszeLuYdOFX7mdlGtHLG4sXosjJyFFbp24GJl38tDd0flZbEMy0ccDbw5B8ZA6E2clsVhFGSJYPsCpDeLpsRs7DS9gXvj+v/fuDjx4SdcYjb21csDQxhJPpdK1CuJFd0ffLnJNoX4RFHd4pPFNCvX9X+wOE6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=FuZvlUf+; arc=none smtp.client-ip=209.85.214.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="FuZvlUf+"
Received: by mail-pl1-f226.google.com with SMTP id d9443c01a7336-2d53197d8b5so11649605ad.3
        for <asahi@lists.linux.dev>; Mon, 14 Sep 2026 13:04:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789416296; x=1790021096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5HCcEwGsZkXP6qM0+jBu8phPLOnSGjxwqZlmClhGp2w=;
        b=DgZr69xWDEMyQuCdxexzkYJO3gG7s6Ztg9s2N7FCg8wX2mb2ROIu3lPmL3DpzftgzI
         3LWRSS72ctCmvYtEv0e1PY7nDnLF0TvWMb9jQrTdwvb/9oyVoLneBeSsTSzScANm6ueL
         HsqQ6OPaL/nWlH5MFbCjrAU/t6kNyqCLDH6akVIrN6OWG8OQ76CLIDbsNBnOtAnayAZl
         mQzvnAVWrge3z31YDGlWeJ2lf2atVfcB+MPJMFgP/GXLLd8/k6GLjV39pZk+9RBnOrSi
         D6hMeCCKmzjPMpefv9W0LsQZzWK5y8b7jNO79Gq13Or2c6bLXKb6C5F2GSDxCesl+ruY
         jD/g==
X-Forwarded-Encrypted: i=1; AKwUvBzJUvhAIStdKK0om6cpy0N+9uj0IymeQ56M4bHxVK3ZT4eBDpxUBgHXCo/HADJBl8IMgkeQrw==@lists.linux.dev
X-Gm-Message-State: AFuF++mF2HjqXyUGDuHXm3NvC8Dm0u//DbP8K7XrUxkWiXZGVnVDAHUV
	WG8hwFGEgLiwLpNhNRj3YrmSMpHXdDEm6Clrf6PTOfY6X8xH8Vp26Zx/ap9oXHhzKTOh9m+GlDa
	pJJAyhhXQ2UFsD14rdDfDx7WoI+ucwxenFfSnGy5UIjlEw1hNLviNUdl6QeWnqu5k4SY5PD05tv
	J0fhS3qW90B2RgHBLhDtJJhaj+08zgQLgWR/h3UIUurrWlgt6pHszCgmM12Nas5zHObTjpMUboQ
	h4oFMohN9UEBEY6
X-Gm-Gg: AYBFou1PFfCvKsZuzGPWRVxswNixqfPq5DEwYsnWVPK5B40QQ4l/zZFRTYoxfkLe1Jr
	BrRtSynDzWsIkyPIgNEqCs5A8ZYf7v5Gop7IZ/HntiVgpwgRfId+1iHNlO1W/JAgZasGVffUy6C
	2+hwWKOVW0ieP6AFhItGsZTufPlFhIS7RqfyJfFQMiw2yguebGwgX1qODmxppscNZZhx7xtHfkF
	UTuaJrxR1AMARhdmP235Dbswnb5zqSURSKESrGV9CgpUVXzvR3naq3XN46TDdt2sjPd06j+r18t
	3wiYCB1ZM9gBAtwAMCbNSDYCnnK/jmwH1SzCmzPWgZh1yQPU/r6GAv+x6UogqCje4YO+hiwsPbd
	ZKm0N76FwuMHkoH3twoVSQ0sIp3jCW7o69Nb75LXxZU3KPptzrZW1yow3A7IWqnysfi+ePXXoPw
	unyWEs2+tIUW9wmfOc0w4dr8wcZJL/AYGWxgpsLoTMlQ==
X-Received: by 2002:a17:902:ec82:b0:2da:f1b1:56c4 with SMTP id d9443c01a7336-2dd6c5b0e60mr78496685ad.3.1789416296516;
        Mon, 14 Sep 2026 13:04:56 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2dd2cfcb57asm4716585ad.12.2026.09.14.13.04.56
        for <asahi@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Sep 2026 13:04:56 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93909014c85so707298185a.0
        for <asahi@lists.linux.dev>; Mon, 14 Sep 2026 13:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789416295; x=1790021095; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5HCcEwGsZkXP6qM0+jBu8phPLOnSGjxwqZlmClhGp2w=;
        b=FuZvlUf+7sG4qQ9bhXYPvfAAbAnQ9dKDiE/L6a09AO5DGKBowOx0R9f6jRbXBusVqN
         H4ZcYH7cGO0eSd6nX0VLnivow49t9Y0pPIbivHwD5V/W1u+XQ5kxX+QuHDv7AuduVaT/
         Mwe7MFaSf7EP7m/QXWyGqJL2cw8rTOz9yHy/E=
X-Forwarded-Encrypted: i=1; AKwUvBwk9x9Ai0aLAB7dr2RqvdLmZhY7vamwDEmQ6PSOXjXJwFvfX1bLV7BhVf5FkSpMta9gUKqdWA==@lists.linux.dev
X-Received: by 2002:a05:620a:2590:b0:93a:14c:3296 with SMTP id af79cd13be357-93a2985552emr600513685a.15.1789416294885;
        Mon, 14 Sep 2026 13:04:54 -0700 (PDT)
X-Received: by 2002:a05:620a:2590:b0:93a:14c:3296 with SMTP id af79cd13be357-93a2985552emr600505585a.15.1789416294251;
        Mon, 14 Sep 2026 13:04:54 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939ebda519bsm1038790085a.26.2026.09.14.13.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 13:04:53 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Janne Grunau <j@jannau.net>
Cc: Hante Meuleman <meuleman@broadcom.com>,
	Gautam Shukla <gautams@broadcom.com>,
	Kalle Valo <kvalo@kernel.org>,
	Pieter-Paul Giesberts <pieterpg@broadcom.com>,
	Jason Huang <jason.huang2@infineon.com>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	asahi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH] wifi: brcmfmac: cfg80211: Report port_authorized for 4-way HS offload
Date: Mon, 14 Sep 2026 22:04:49 +0200
Message-ID: <20260914200449.1747117-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260912-brcmfmac-4way-handshake-offload-authenticated-event-v1-1-e41a6a8281a2@jannau.net>
References: <20260912-brcmfmac-4way-handshake-offload-authenticated-event-v1-1-e41a6a8281a2@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Sat, 12 Sep 2026 11:40:51 +0200, Janne Grunau wrote:
> Since commit 416386060 ("Mark authorization completed on driver
> indication during 4-way HS offload") [0] wpa_supplicant expects
> NL80211_CMD_PORT_AUTHORIZED to complete the authentication when the
> driver supports 4-way handshake offload.

In brcmfmac for 4way offload the driver waits for two dongle events before brcmf_is_linkup()
returns true and subsequently brcmf_bss_connect_done() is called to inform wpa_supplicant. At
that time the supplicant did not rely on NL80211_CMD_PORT_AUTHORIZED.

[...]

> Link: https://github.com/zephyrproject-rtos/hostap/commit/41638606054a09867fe3f9a2b5523aa4678cbfa5 [0]
> Link: https://lists.infradead.org/pipermail/hostap/2024-August/042893.html [1]
> Link: https://bugzilla.redhat.com/show_bug.cgi?id=2302577 [2]
> Link: https://lore.kernel.org/linux-wireless/20260911065656.1269623-5-Jason.Huang2@infineon.com/ [3]
> Cc: stable@vger.kernel.org
> Fixes: b8a64f0e96c2 ("brcmfmac: support 4-way handshake offloading for WPA/WPA2-PSK")

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend

> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
