Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703393;
	b=iZnuPt/5ZglsOIDopUIEiGuExlOm0qA1cVxUnECBSxCt/BLvslWeygft2THx6vwTujlL
	 +HOVsNBTXVpdBkolIME3bjBjX9OOXNBois12JrgGpmBIjUI58xWTHQ/j3wykjQlEoaLPd
	 PkwiDReLJutE4gDzpAyuy7hXx3gzBQOGx25xEYfY1Xkxui/pvSjYS6ENEhM6vUgXF3+c/
	 5KMfgoMRJxhqCAjLjzTJixQq06aSjKCKXCHqARVKUDX8f3bHSX46kpVuSEnOPmnOilM4+
	 Ic61xCwe0G6QwD2sHj4WgPeXZ9IFoW7Q5V+shRppg4ijTcu2ASWqpKIa+vhy4eaaHjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703393;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=7JPjcO3yPvVZuSkwbOCs9C3BldA842+CvKCTpIECa48=;
	b=GY2BaXtF45t8KJYJnaLj9n+2o7x4eKgS6r7jIhQM7K1QL0nyibH3aRvrfddCkv8NgtkK
	 JPJPdFBkUfGmrCd5BpEwzKxrBNLeKwcQB3IrARUSbkTSi79dJhFhyHe6v3zBVHI5hj7Y7
	 igzzJ3meWMLFQjAGYjxQTl9Sa6TVgBCwDXhPbrx11dmcIrDNTIZo5mYEvnqbFA0lTP8e9
	 eMQPpUg16T+h9x9DVSlmFbpBKillDr1gGmjlNh+s4p/NpplGH3oIqHrU49Grm4oPnvgTa
	 j3f9DnX05z3prXRw43qKxl/pH0M/Jfmv1oyx9HVxrZ3ZabICg67v6MZcmRSF2/g+Tqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=X8kLT8e8;
	arc=none smtp.remote-ip=209.85.215.227
Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493CB606A68D
	for <asahi@lists.linux.dev>; Thu, 26 Nov 2026 14:29:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 493CB606A68D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=X8kLT8e8
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-cd6acc50b8dso3651518a12.3
        for <asahi@lists.linux.dev>; Thu, 26 Nov 2026 06:29:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703392; x=1796308192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7JPjcO3yPvVZuSkwbOCs9C3BldA842+CvKCTpIECa48=;
        b=1UQlcoiFFrEj8Qw1gD4iaYaCU/5K+fuUtibe+OFeMj5hVbbqBKMz86aMcEVy+4RYZP
         0VYhJMlRA7Gp+pXa/66hjurYUK3J0avPVwEIpc1NbAbXONu8QIE85d6gG5cw8Jx0Ge3/
         SEWuhNbIeeIjPUfqM9Okk9JYJuph8S2fjwacQx82pVHGp3hG+mz/4Vfb1+YxpR5C2BfY
         vLNgRXa3JYEAMu4l4vjEj1Z1nA7e3N2FmTbbFdvPtWoMKaNRIxuv02tRXJZan4erqFER
         u6jNW1ba+2P/NY4HX+s4aRQ8I61/thNYR5g9w4s7OQ/kRjmwvU5haEBUImFb2vu04rWm
         vLtg==
X-Forwarded-Encrypted: i=1; AL+hErFvrrtK/V8XsXXsTK3DVbKSUoWPEGxpzcqQtxF37JPY02GWIqJK9hR/c+AXqdfvLMpQqkFquQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z9gcAduiIF/155DLh54emIR1LZ5BvVuZ5LjgvujhKSOevtBqIkU
	dFx1YCcbpiHsgl8Xf5RE63Fz6Z66iPJ1F9kAkybR0uWbhHPtUbuXT6RJvwc2q/PTdlVyPqkWBMH
	Fq3KrCJ5iRIaRWaUR3EPpB4C7PRrGYLz2IZHOrS2hkXe2eg2s8m5Skwtc26+4HPCwx1hIlrlG5D
	4D0XOfn24Ki/dq4c/kbrPvq14q4ybGiqME651skIxSL9mxP9bjbe7eWz2Rw5gvflDlkCV85c7c4
	jKm5ZJeXBcnL21g
X-Gm-Gg: AZFdTZcvB5r+t4aTCE5DmrkmVUls9Q/bJU2S9LHH2ruseFKubZHGJUwItdy4gv00i1t
	Z3kaDcnWoGFBgdJ4HgrmPdv1Zf8MQFhNN/ulwiuab95hY3H1t9cHVBdxExlC6WXA+ZLgu+t8cw8
	zyRf6LoWUqOlkIgM5TADQkbLpZpIRfesZCHvyIIVrhVYB1xi3PiEpQZXByC1RJIZ79lvPsfHdh3
	0Z+yen8tdeCEzvxeUtqXnobnHOOleHCFp4v0B6MmFhx2D75LY4yEH+nJkBJKrl9bdZbQGurualf
	HLXO9sSHoONlYOD0Z7ENrJwpWEMNlCE9+4WyHcZ+PRg8IQWtCvqaDVE+L3XRn5kU8XP72KHQvoT
	hghZnMF/HCguVqx+1sEci/5z1DY/vhvURuLf8TcymAMtXccFzKkWCMKWREznqUIt9+2+KPBHBj6
	DeZuU2DK/KCuCT+IpW87Mad62XdFm8au9QZNyIBzw=
X-Received: by 2002:a17:90b:3d92:b0:3b1:2237:3c93 with SMTP id 98e67ed59e1d1-3b41c8de8d7mr17630117a91.18.1795703391516;
        Thu, 26 Nov 2026 06:29:51 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41ffad038sm6761574a91.3.2026.11.26.06.29.51
        for <asahi@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:29:51 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-55ba5fccc4aso38649281cf.2
        for <asahi@lists.linux.dev>; Thu, 26 Nov 2026 06:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795703390; x=1796308190; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7JPjcO3yPvVZuSkwbOCs9C3BldA842+CvKCTpIECa48=;
        b=X8kLT8e8Uyh+76lh8si/zV6o1Ooh+xTO7R+F0Yl1JEbl+jPkhs80jfJ6SHLaly7lTK
         aziyQm9y9B6dcWt1BlTSyMtCqTKLWVS5DL5o8743A3n83x1TvrSjQfWgainQyKKaH+NK
         AuiUiIuDYZZA1RCUrOOgX6r5VO8tvMWi3IH38=
X-Forwarded-Encrypted: i=1; AL+hErEd3Q+OjIIcxbUTxacrEmL1VBGZ7Cl7Tf4vZ9SfiDhVm8krlrnj8FvgyW4rXUgFiRs6lyoPhA==@lists.linux.dev
X-Received: by 2002:a05:622a:58c6:b0:55d:36d3:a949 with SMTP id d75a77b69052e-55d769ea509mr410976511cf.27.1795703390121;
        Thu, 26 Nov 2026 06:29:50 -0800 (PST)
X-Received: by 2002:a05:622a:58c6:b0:55d:36d3:a949 with SMTP id d75a77b69052e-55d769ea509mr410976211cf.27.1795703389662;
        Thu, 26 Nov 2026 06:29:49 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d788506b0sm181098511cf.17.2026.11.26.06.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:29:48 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Andre Eikmeyer <dev@deq.rocks>
Cc: arend.vanspriel@broadcom.com,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	michael.reeves077@gmail.com,
	marcan@marcan.st,
	j@jannau.net,
	asahi@lists.linux.dev,
	sebastian.reichel@collabora.com
Subject: Re: [PATCH v2 3/5] wifi: brcmfmac: pcie: probe again after a resume through firmware
Date: Thu, 26 Nov 2026 15:29:39 +0100
Message-ID: <20261126142942.881504-2-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111120748.23795-4-dev@deq.rocks>
References: <20261111120748.23795-4-dev@deq.rocks>
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

On Wed, 11 Nov 2026 13:07:46 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
> After ACPI S3 the chip comes back without its firmware, but the
> interrupt mask can read back nonzero, so brcmf_pcie_pm_leave_D3()
> takes the hot resume path and every command times out afterwards.
> Seen on the BCM4377 and BCM4364 of the T2 Macs.
>
> When the platform firmware handled the resume and WoWL is off, go
> straight to the existing remove and re-probe path.
>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>

[...]

> ---
>  .../net/wireless/broadcom/brcm80211/brcmfmac/pcie.c    | 10 ++++++++++
>  1 file changed, 10 insertions(+)

[...]

> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
> @@ -2844,6 +2845,15 @@ static int brcmf_pcie_pm_leave_D3(struct device *dev)
>  	devinfo = bus->bus_priv.pcie->devinfo;
>  	brcmf_dbg(PCIE, "Enter, dev=%p, bus=%p\n", dev, bus);
>
> +	/*
> +	 * Without WoWL the device is powered off when the platform firmware
> +	 * handles the system sleep, as with ACPI S3, and comes back without
> +	 * its firmware. Its registers can still read back nonzero, so probe
> +	 * it again.
> +	 */
> +	if (pm_resume_via_firmware() && !devinfo->wowl_enabled)
> +		goto cleanup;
> +
>  	/* Check if device is still up and running, if so we are ready */
>  	if (brcmf_pcie_read_pcie32(devinfo, devinfo->reginfo->intmask) != 0) {
>  		brcmf_dbg(PCIE, "Try to wakeup device....\n");

This applies to every chip handled by brcmfmac PCIe on any platform that resumes
through platform firmware, while the problem was seen on the BCM4377 and BCM4364 of
the T2 Macs. A device that keeps its power across S3 elsewhere resumed fine through
the hot resume path and now gets a full firmware reload. Please limit this to the
affected chips (e.g. check devinfo->ci->chip) or explain why a re-probe is right for
all of them.

The series "wifi: brcmfmac: pcie: recover from fatal PCIe errors"
(https://patchwork.kernel.org/series/1203582/) also re-probes the device, from its
PCI error resume callback with device_reprobe(). An error that hits during a
resume through platform firmware could start both re-probes. Please check how the
two interact, and make sure only one of them runs.

Regards,
Arend
