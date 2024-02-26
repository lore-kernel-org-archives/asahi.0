Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E891DFC4
	for <asahi@lists.linux.dev>; Mon, 26 Feb 2024 20:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708980536; cv=none; b=T4NuTSCbtoaHPg2i7rPiDjU+8mE1h8HOC70SRz19rbH+oa7FeXQjvEYl/fEvSN2wLlNsuLbHY9ReCJlAkwUgPcfPo3AuGUkhwwF5qavgfLcoV8YiD8ml+snUpvC13qDxNxvSsGxjIGJYnsz+c0PkFD4VmGPopqPJoNsjT5g/Jpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708980536; c=relaxed/simple;
	bh=0grSemTt2/mo5cV+bYd/dzfqGSMbZr2VwUx4eugQFBk=;
	h=Date:Message-Id:From:To:Cc:In-Reply-To:Subject:References; b=TLwXOJCbVJ7l/tl/rdaiaVODmeVFAL3wT4ZIwXGtZjGZh66CsF4nz7sVIGTbfUf+BtW6HJpaQLMdIjtpidCZbV8LMG/2LaP8Q8MgRIa+hJjXE8GZUPWMOZWKrOyP+SALSMDOK8CTh0LFnkVm3VHgipPT01o3poM5YelPY9HT628=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xs4all.nl; spf=pass smtp.mailfrom=xs4all.nl; dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b=Jj3upY0Z; arc=none smtp.client-ip=195.121.94.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="Jj3upY0Z"
X-KPN-MessageId: 4721b05c-d4e8-11ee-b571-005056992ed3
Received: from smtp.kpnmail.nl (unknown [10.31.155.8])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 4721b05c-d4e8-11ee-b571-005056992ed3;
	Mon, 26 Feb 2024 21:47:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=subject:to:from:message-id:date;
	bh=PoRDmtVxJ0rjyftlZISC6h8oVv9UnIGoPvoj3Ivlv5Y=;
	b=Jj3upY0ZZu0D+KMVvO37HgqxhNeKaMECBXtGX5gdvsRb1/0PR9tIuQiHsG6VaETMm1H9rCaeu/TPL
	 xe4QC1NbSlDaKGdlg/IptqNf4hvw27wpuqo/bYExyfFrLPKFADtkvJ65v4Op+gEFlYP/OnIh9vq+Po
	 B2s/OgGv4sQP0ZXi2qR+3ZL6+btEtL7/A79Y5b7QCThEFevWuTxhplsGeW34ovyecgO/+D+9PSuNsr
	 axGgLc0VtFpJ5qjpEx+7lh0fnHVkW4opl+vWCLkrJxTnAP94Iqyay7yneqR/pPRRpUQK7v9ov2J8W0
	 Wbg0dbDVeTPvwlJSFbD89bLoBiplB8A==
X-KPN-MID: 33|qpJncOkMi7nRs8UhdDUPsKXq17GUlXm27XTLcRvByQbu1CSvZQmjvHBib+YiLh9
 uUol01JFOMDWPgWKZR98zoGL+RkJVsOVwnBmHITU0INU=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|FzACM9BNCEJ5gnbGsHVsizNQK9VEp2FQI8Z1c38rSFR5bgt0dj4RPU8o8pU769+
 +au+CRYUAXIW0QP5A5PJrqQ==
Received: from bloch.sibelius.xs4all.nl (80-61-163-207.fixed.kpn.net [80.61.163.207])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id 49517708-d4e8-11ee-8952-00505699d6e5;
	Mon, 26 Feb 2024 21:47:43 +0100 (CET)
Date: Mon, 26 Feb 2024 21:47:42 +0100
Message-Id: <874jdvj6kx.fsf@bloch.sibelius.xs4all.nl>
From: Mark Kettenis <mark.kettenis@xs4all.nl>
To: Marek Vasut <marex@denx.de>
Cc: j@jannau.net, bmeng.cn@gmail.com, trini@konsulko.com,
	u-boot@lists.denx.de, asahi@lists.linux.dev, marcan@marcan.st
In-Reply-To: <85d561a6-54cb-4c1c-bfb0-559163e859c0@denx.de> (message from
	Marek Vasut on Sun, 25 Feb 2024 22:57:23 +0100)
Subject: Re: [PATCH 4/6] usb: kbd: Ignore Yubikeys
References: <20240221-asahi-keyboards-v1-0-814b2e741790@jannau.net>
 <20240221-asahi-keyboards-v1-4-814b2e741790@jannau.net>
 <2acb9976-a40e-4977-b7ca-2462e84251ed@denx.de>
 <4c1c6b72-ffe5-4ff3-8d12-9fc0b956643d@app.fastmail.com> <85d561a6-54cb-4c1c-bfb0-559163e859c0@denx.de>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>

> Date: Sun, 25 Feb 2024 22:57:23 +0100
> From: Marek Vasut <marex@denx.de>
> 
> On 2/25/24 5:07 PM, Janne Grunau wrote:
> > Hej,
> > 
> > On Wed, Feb 21, 2024, at 13:41, Marek Vasut wrote:
> >> On 2/21/24 08:25, Janne Grunau via B4 Relay wrote:
> >>> From: Hector Martin <marcan@marcan.st>
> >>>
> >>> We currently only support one USB keyboard device, but some devices
> >>> emulate keyboards for other purposes. Most commonly, people run into
> >>> this with Yubikeys, so let's ignore those.
> >>>
> >>> Even if we end up supporting multiple keyboards in the future, it's
> >>> safer to ignore known non-keyboard devices.
> >>>
> >>> Signed-off-by: Hector Martin <marcan@marcan.st>
> >>> ---
> >>>    common/usb_kbd.c | 19 +++++++++++++++++++
> >>>    1 file changed, 19 insertions(+)
> >>>
> >>> diff --git a/common/usb_kbd.c b/common/usb_kbd.c
> >>> index 4cbc9acb73..774d3555d9 100644
> >>> --- a/common/usb_kbd.c
> >>> +++ b/common/usb_kbd.c
> >>> @@ -120,6 +120,15 @@ struct usb_kbd_pdata {
> >>>    
> >>>    extern int __maybe_unused net_busy_flag;
> >>>    
> >>> +/*
> >>> + * Since we only support one usbkbd device in the iomux,
> >>> + * ignore common keyboard-emulating devices that aren't
> >>> + * real keyboards.
> >>> + */
> >>> +const uint16_t vid_blocklist[] = {
> >>> +	0x1050, /* Yubico */
> >>> +};
> >>> +
> >>>    /* The period of time between two calls of usb_kbd_testc(). */
> >>>    static unsigned long kbd_testc_tms;
> >>>    
> >>> @@ -465,6 +474,7 @@ static int usb_kbd_probe_dev(struct usb_device *dev, unsigned int ifnum)
> >>>    	struct usb_endpoint_descriptor *ep;
> >>>    	struct usb_kbd_pdata *data;
> >>>    	int epNum;
> >>> +	int i;
> >>>    
> >>>    	if (dev->descriptor.bNumConfigurations != 1)
> >>>    		return 0;
> >>> @@ -480,6 +490,15 @@ static int usb_kbd_probe_dev(struct usb_device *dev, unsigned int ifnum)
> >>>    	if (iface->desc.bInterfaceProtocol != USB_PROT_HID_KEYBOARD)
> >>>    		return 0;
> >>>    
> >>> +	for (i = 0; i < ARRAY_SIZE(vid_blocklist); i++) {
> >>> +		if (dev->descriptor.idVendor == vid_blocklist[i]) {
> >>> +			printf("Ignoring keyboard device 0x%x:0x%x\n",
> >>> +			       dev->descriptor.idVendor,
> >>> +			       dev->descriptor.idProduct);
> >>> +			return 0;
> >>> +		}
> >>> +	}
> >>
> >> I vaguely recall a discussion about previous version of this, I think
> >> the suggestion was to make the list of ignored devices configurable via
> >> environment variable, so users can add to that list from U-Boot shell.
> >> Would it be possible to make it work this way ?
> > 
> > oh, I completely forgot that this patch was already submitted. I briefly looked through asahi tree for related patches and did not check whether this was previously submitted.
> > I've added environment based blocking as separate patch with blocking either complete vendor IDs or vendor, product ID combinations. A separate patch to simplify authorship tracking and the implementation doesn't share any code.
> 
> It would be better to have only one patch which does not hard-code any 
> USB IDs, and then add those blocked IDs via U-Boot default environment 
> for this specific machine. We cannot predict what yubico will do in the 
> future, whether they might make a device that shouldn't be blocked for 
> example. If they do, the user should be able to unblock their device by 
> running e.g. '=> setenv usb_blocklist' instead of updating their bootloader.
> 
> I think a simple list of blocked VID:PID pairs, maybe with wildcards, 
> would be nice, i.e. something like 'usb_blocklist=1234:5678,1050:*' to 
> block device 0x1234:0x5678 and all devices with VID 0x1050 . That should 
> be easy to parse with strtok()/strtol() or some such and the code should 
> not be too complex.

I do like the idea of having a configurable list of usb devices to
ignore.  The U-Boot USB stack is still not perfect and there are still
USB devices that will prevent us from booting when connected.  The
list will provide a nice workaround for that issue.

But the yubikeys will cause the same problem on other boards as well.
So I think it makes sense to put those in a default list.
