Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703402;
	b=0o9EtgW+XNmS8KcdB36ZZg+RfIBl8zAOxDKRzF6N+NhcFnP8iiGEEW3yh+fB8z9f5pFT
	 Cr+6k03nV+DvPQfX/fxneYFp6K0V1B7oPElq4VwfV1AkpGzBWCP3gowu9djaIXVxV3GLF
	 kVU+aCWCxOiZOlyhoIo3lAsWTRLpNzsOCXhaeeDuHewm0hUIyH9+bvnKveL5NwEttkTK+
	 ER/oGA35Y7GTvc4tDmioi18D5ag5tHwkY3bTpZfZFcRfbl8BsUONCOr7tFQ0E1WiMpz/Y
	 XLkoi+z6Gjqahmy7G1ueI0H0aHerU3gsJX7HxmR3xzoV4f/bltV+1TaIWKKTRal3Ktg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703402;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=VjqQuEBBQvXUyQLlY4Gl4q1TSfCP6TKWu5ONTcrIr9c=;
	b=3VM9TyWPiEVtwd+GtQ/kcNRwNFFhzFrn9LL4dQgWMY6wKxbGBPfbViILk+pkGM6Ew1Tl
	 x6ToIMh/WXSeNsE56vWasvr3dVXTQPBwZ7ZsWX+uP5XWa9UJd0BMdBGOhKq7OhpC0bgGu
	 xNVhp+/HGLyzk0gH7aZX/y7YrFDAsUThKK4WBvFpuE3YLygq2QeCzWmS2DqTUkqexaxtJ
	 LI/90QN8GNmgL8p8zQ1WIau74jsJz7vGw/dwsl3KFi+K20aaeuD6raHZk7HT/zo+rNzqL
	 qC2R6/CsorKWExsY3wEGm3/WYtD2LrXK62k61as8pCKEK0rAT4k8P9qV6mQxrPgKb8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Xo6m8cwr;
	arc=none smtp.remote-ip=209.85.210.97
Received: from mail-ot1-f97.google.com (mail-ot1-f97.google.com [209.85.210.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543FC606A698
	for <asahi@lists.linux.dev>; Thu, 26 Nov 2026 14:30:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 543FC606A698
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Xo6m8cwr
Received: by mail-ot1-f97.google.com with SMTP id 46e09a7af769-85a5455bd3cso3906168a34.3
        for <asahi@lists.linux.dev>; Thu, 26 Nov 2026 06:30:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703401; x=1796308201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VjqQuEBBQvXUyQLlY4Gl4q1TSfCP6TKWu5ONTcrIr9c=;
        b=DHBYbUduIDuoRFBeDwol4B1rGs1O9H0WKNyTehbKjGoYNXtMnKJ11TvkwzVKvOh7+g
         +Z7wgvb3e6F/j98upt6oZc7bTSoYnVPGxqh7PtBKBJg/1C1ACwP8YCWzgWYxMqe0UCX3
         I0SXy339tzPOTUMTJIV9kA+6p5xwYPT1jWpkh8AM3e+RE1JEFrdGDpJJlcp1FixnfAdK
         R65sN63ljwVIPHvuoJqZOa/nrAWaKcxx97u+/jP0p45X7U4MS/XkMVaIssgrWfKjTwG+
         pLWOAfEPk0KTTk5F31/fHIIrY8YlQYn19rc+hi9UTbBfBcx8oja+OAPvT1opkOl8Chjp
         Glow==
X-Forwarded-Encrypted: i=1; AL+hErFrst6Du9j+lnIw916Q/Rg1MM+JfKf5bCAwzBtmHlkH0V2or3PD6TsDpP4drg70ZncJmo5cUg==@lists.linux.dev
X-Gm-Message-State: APuU4Z9WvEu0hcPSKrAM/gEQGP1gf8tDK7vIcN1DNQp6NxKsqnxjgMmK
	1s0xmvyi8U6oA2Jd9MK8hSG7uPceRT4rM9qZmiTGFLjtxnoNWLbm0MKVbPFBrJ9MAQ/2Tlqy4BP
	1AM6+z/Z/MR1VbDcn2a7Sr/S76HeuD3zYj+EBb7PZ4jF1sSXtqRUK8nbjkGb+FLzun8ZGroky0r
	5nn0RXuNCqJmVvMjfJR5d8AvgVf1TZMHZDTUt9Wg0LO/iOWZYsqNULYTDymSRM+48fKDlgm0vm+
	ygLmhYVC6YOFV9x
X-Gm-Gg: AZFdTZe8cQmoehDC5kcFUutWVsH6bcYnt/jYQ3L0q9vRIqwWUVgRXlGYXg4FfuNwgIt
	5kZLB0nL4ErmTq9mZtVtR2nCWMbgRqAY/i6FsC50ILweIjcdf5oWOiDJGukjmq6QF5Ul1EfG/Qi
	GTRyepJlAPZO+fSX79nJaU1YcuJZKfEEbffu0uD6/lkJJjoHtzcsKxAhXqrPezCESbWQcJgRg+n
	J6RgYAHGS1jHsATRdGdRQtPBSuC/9ljCCYpgOIZdvzg7GaDlJimsjmL98ExhfLrk+ucvRxJ+9ao
	CEfLDp6SVEonR9dZwqwJTJ3QEBVTzw6hOxo72FonhOt2lsER42/+MgUkJ81mBDxU5bXZa6BIKsI
	ljLKsHqf4pbvsBcbEz2jeducnJuOtSMnlDtGSHb10Tb71T3QC18OpaC12+829d0XBJy5LmjcXTT
	TpFePgC6v81c7qkruTPaw7GED/BepBalGMaU9+TmCUwg==
X-Received: by 2002:a05:6830:4c18:b0:824:e29:e00e with SMTP id 46e09a7af769-863159c069fmr22073246a34.20.1795703401042;
        Thu, 26 Nov 2026 06:30:01 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 46e09a7af769-86389ffc8f8sm1843a34.17.2026.11.26.06.29.59
        for <asahi@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:30:01 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-53639e47be2so133284591cf.3
        for <asahi@lists.linux.dev>; Thu, 26 Nov 2026 06:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795703399; x=1796308199; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VjqQuEBBQvXUyQLlY4Gl4q1TSfCP6TKWu5ONTcrIr9c=;
        b=Xo6m8cwrNzmEyLAsm8ClKPglyEFcwPqrSWa+VA+RyI0zjWdIAxBBtYl/rj1ORfjiEF
         Iqvm6lRObtXbKmV4reNYkN2T4nB8b4pPLACGpLPxG45Tcui4S5QyBEG2KrxDus99Ey3F
         AmvpQS3BKsglW+qyupPi8nr/bjZjQ8l6wZSKg=
X-Forwarded-Encrypted: i=1; AL+hErFLoWyDCmlZB51+eys/l0SnOb+3JRDl9dj2bcYwlD1xISnqU3PuN3ic/emeCcmZ2eRzBr38Xw==@lists.linux.dev
X-Received: by 2002:a05:622a:90c:b0:55c:ec48:199d with SMTP id d75a77b69052e-55d76a904a4mr364421981cf.48.1795703398936;
        Thu, 26 Nov 2026 06:29:58 -0800 (PST)
X-Received: by 2002:a05:622a:90c:b0:55c:ec48:199d with SMTP id d75a77b69052e-55d76a904a4mr364421641cf.48.1795703398410;
        Thu, 26 Nov 2026 06:29:58 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d788506b0sm181098511cf.17.2026.11.26.06.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:29:58 -0800 (PST)
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
Subject: Re: [PATCH v2 5/5] wifi: brcmfmac: pcie: support inband device wake and deep sleep
Date: Thu, 26 Nov 2026 15:29:42 +0100
Message-ID: <20261126142942.881504-5-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111120748.23795-6-dev@deq.rocks>
References: <20261111120748.23795-6-dev@deq.rocks>
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

On Wed, 11 Nov 2026 13:07:48 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
> The BCM4364 and BCM4377 firmware report inband deep sleep in the PCIe
> shared flags. The driver only advertises that it has no out-of-band
> device wake, which leaves deep sleep disabled. The firmware then stays
> awake and keeps its latency tolerance short enough to hold the package
> out of PC10.
>
> Advertise inband device wake when the firmware supports it and follow
> the handshake of the firmware. The device asks for deep sleep while
> device wake is deasserted, the host acknowledges it once it has nothing
> to send, asserts device wake before it uses the rings again and waits
> for the exit note, and deasserts device wake after 200 ms without ring
> writes. Hooks around the ring lock cover every host to device ring
> writer. A system suspend asserts device wake before D3_INFORM and
> acknowledges no deep sleep request until the resume.
>
> Tested on a MacBookPro15,1 (BCM4364) and a MacBookAir9,1 (BCM4377). The
> firmware enters and leaves deep sleep about 40 times a minute at idle
> with Wi-Fi associated, traffic and downloads work, and the package
> reaches PC10 without ignoring the latency tolerance of the Wi-Fi port.
>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>

This patch does not apply to wireless-next main: the struct brcmf_pciedev_info hunk
conflicts with the sig_name/fw_size/skip_reset_vector members added by "wifi:
brcmfmac: Load signed PCIe firmware images". Please rebase on wireless-next.

[...]

> ---
>  .../broadcom/brcm80211/brcmfmac/commonring.c  |  14 ++
>  .../broadcom/brcm80211/brcmfmac/commonring.h  |   5 +
>  .../broadcom/brcm80211/brcmfmac/pcie.c        | 233 +++++++++++++++++-
>  3 files changed, 249 insertions(+), 3 deletions(-)

[...]

> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
> @@ -892,17 +918,184 @@ brcmf_pcie_send_mb_data(struct brcmf_pciedev_info *devinfo, u32 htod_mb_data)

[...]

> +static void brcmf_pcie_ds_send(struct brcmf_pciedev_info *devinfo, u32 data)
> +{
> +	mutex_lock(&devinfo->ds_mutex);
> +	WRITE_ONCE(devinfo->ds_sender, current);
> +	brcmf_pcie_send_mb_data(devinfo, data);
> +	WRITE_ONCE(devinfo->ds_sender, NULL);
> +	mutex_unlock(&devinfo->ds_mutex);
> +}
> +

[...]

> +static void brcmf_pcie_ds_wake(struct brcmf_pciedev_info *devinfo)
> +{
> +	bool assert = false, wait;
> +
> +	if (brcmf_pcie_ds_skip(devinfo))
> +		return;
> +
> +	spin_lock(&devinfo->ds_lock);
> +	devinfo->ds_active++;
> +	if (devinfo->ds_state == BRCMF_PCIE_DS_SLEEP) {
> +		devinfo->ds_state = BRCMF_PCIE_DS_EXIT_WAIT;
> +		assert = true;
> +	}
> +	wait = devinfo->ds_state == BRCMF_PCIE_DS_EXIT_WAIT;
> +	spin_unlock(&devinfo->ds_lock);
> +
> +	if (assert) {
> +		brcmf_dbg(PCIE, "deep sleep: assert device wake\n");
> +		brcmf_pcie_ds_send(devinfo, BRCMF_H2D_HOST_DW_ASSERT);
> +	}
> +	if (!wait)
> +		return;
> +
> +	/* The exit note arrives through the interrupt thread itself */
> +	if (devinfo->in_irq) {
> +		usleep_range(1000, 1100);
> +		return;
> +	}
> +	if (wait_event_timeout(devinfo->ds_wait,
> +			       READ_ONCE(devinfo->ds_state) !=
> +			       BRCMF_PCIE_DS_EXIT_WAIT,
> +			       BRCMF_PCIE_DS_EXIT_TIMEOUT))
> +		return;
> +
> +	brcmf_err(dev_get_drvdata(&devinfo->pdev->dev),
> +		  "no deep sleep exit after device wake\n");
> +	spin_lock(&devinfo->ds_lock);
> +	if (devinfo->ds_state == BRCMF_PCIE_DS_EXIT_WAIT)
> +		devinfo->ds_state = BRCMF_PCIE_DS_AWAKE;
> +	spin_unlock(&devinfo->ds_lock);
> +}
> +

devinfo->in_irq is a device wide flag that is true whenever the interrupt thread is
running. Another thread (tx worker, ioctl, flowring worker) that gets here while the
interrupt thread is running takes this branch, sleeps 1 ms and writes the ring while
the device is still waking up. Please check that current is the interrupt thread (for
instance record it like ds_sender) instead of looking at in_irq.

The return value of brcmf_pcie_ds_send() is ignored here and in the ack paths. If the
write fails, every ring lock waits the full 500 ms for the exit note, or the state
says sleep while the device is awake. Please handle the failure.

[...]

> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
> @@ -1821,6 +2021,10 @@ brcmf_pcie_init_share_ram_info(struct brcmf_pciedev_info *devinfo,
>  		if (shared->flags & BRCMF_PCIE_SHARED_DAR)
>  			host_cap |= BRCMF_HOSTCAP_H2D_DAR;
>  		host_cap |= BRCMF_HOSTCAP_DS_NO_OOB_DW;
> +		if (shared->flags & BRCMF_PCIE_SHARED_INBAND_DS) {
> +			host_cap |= BRCMF_HOSTCAP_DS_INBAND_DW;
> +			devinfo->ds_state = BRCMF_PCIE_DS_ALLOWED;
> +		}
>
>  		brcmf_pcie_write_tcm32(devinfo, sharedram_addr +
>  				       BRCMF_SHARED_HOST_CAP_OFFSET,

The cover letter says this relies on the mailbox over the control ring, but nothing
checks mb_via_ctl here. With the shared memory mailbox the wake and ack messages go
through a different path and I doubt the handshake holds. Please require mb_via_ctl.
Does the firmware want DS_NO_OOB_DW and DS_INBAND_DW both set? This also enables the
feature for every other firmware that sets the flag (BCM4378/4387/4388, CYW), which
were not tested. Please limit it to the tested chips or get it tested on the others.

[...]

> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
> @@ -2757,6 +2966,8 @@ brcmf_pcie_remove(struct pci_dev *pdev)
>  		return;
>
>  	devinfo = bus->bus_priv.pcie->devinfo;
> +	WRITE_ONCE(devinfo->ds_state, BRCMF_PCIE_DS_NONE);
> +	cancel_delayed_work_sync(&devinfo->ds_deassert_work);
>  	brcmf_pcie_bus_console_read(devinfo, false);
>  	brcmf_pcie_fwcon_timer(devinfo, false);
>

This makes all hooks a no-op but does not wake the device first. At idle the device
sleeps most of the time, so the ioctls and flowring deletes that brcmf_detach() sends
after this go to a sleeping device and time out. Also, ds_state is not changed under
ds_lock, so a thread that passed ds_skip() just before can still call
mod_delayed_work() after cancel_delayed_work_sync() (tx worker unlock path or the
interrupt thread exit note), and the work then runs after devinfo is freed. Please
wake the device before disabling, set NONE under ds_lock, check for it under the lock
before queueing the work, and cancel the work after the tx worker and interrupt
handling are stopped.

The series "wifi: brcmfmac: pcie: recover from fatal PCIe errors"
(https://patchwork.kernel.org/series/1203582/) re-probes the device after a fatal
PCIe error with device_reprobe(), so brcmf_pcie_remove() then runs on a device that
just had its link reset and does not answer. Waking the device first would stall
there, and the ring lock hooks would wait on it while devinfo->state is already
DOWN. Please make the wake in remove and the ring lock hooks give up when the
device is not up. Whichever series is applied second will need a rebase.

[...]

> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
> @@ -2811,6 +3022,15 @@ static int brcmf_pcie_pm_enter_D3(struct device *dev)
>  	brcmf_pcie_fwcon_timer(devinfo, false);
>  	brcmf_bus_change_state(bus, BRCMF_BUS_DOWN);
>
> +	if (devinfo->ds_state != BRCMF_PCIE_DS_NONE) {
> +		spin_lock(&devinfo->ds_lock);
> +		devinfo->ds_suspend = true;
> +		spin_unlock(&devinfo->ds_lock);
> +		cancel_delayed_work_sync(&devinfo->ds_deassert_work);
> +		brcmf_pcie_ds_wake(devinfo);
> +		brcmf_pcie_ds_idle(devinfo);
> +	}
> +
>  	devinfo->mbdata_completed = false;
>  	brcmf_pcie_send_mb_data(devinfo, BRCMF_H2D_HOST_D3_INFORM);
>

ds_suspend is not cleared when brcmf_pcie_pm_enter_D3() fails further down (the
WoWL D3 timeout returns -EIO). The PM core does not resume this device then, so no
deep sleep request is acked anymore and the deassert work never runs again. Please
clear it on that error path.

Regards,
Arend
