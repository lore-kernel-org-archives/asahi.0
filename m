Received: from fout8-smtp.messagingengine.com (fout8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D21D5D46B
	for <asahi@lists.linux.dev>; Tue, 26 Mar 2024 08:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711442175; cv=none; b=RO7e08h9Tmld63UDvUYnIna3lkT0FG3rQT3xMpeK1EGl49ri/mGuHVRo6tMFQ8rWWU+arRh7GG+SwAaUkrRLLMenc7kH/OBw5FMLHEfUig+FQt1VcOVuH0PlEKoArNdQuvVu1LZT6QubZatFr3QYhwEcYm0rnem+Xef2C9IbZ+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711442175; c=relaxed/simple;
	bh=ceROzu2W64UHce2ZxC7ptgnw27fZ4j8Ck+SRnUS5I5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cZz8StPskhcw/UvOuNqIUTbRI1xrzj5O+g+zDbQrTydH/6UkFmxwAbAb86WBh6uwRGrcpINLVQReiCgaplrgcDlZOJwGz+loF5XFdN3MI0FohUBUcZoMWrkToWg3EOagK2sm8MMZUWlJL/ri3HrnWzfd45XTBbS/ENEajJyk2AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=yXfkhMGy; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=MNoZPwLR; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="yXfkhMGy";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MNoZPwLR"
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailfout.nyi.internal (Postfix) with ESMTP id 071B51380104;
	Tue, 26 Mar 2024 04:36:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute7.internal (MEProxy); Tue, 26 Mar 2024 04:36:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1711442171; x=1711528571; bh=RqUnATFnkN
	/atbi2LoUUzmsvRFTWnDKu2pDJucNkCR4=; b=yXfkhMGysnnDw2cHPYlqOcvnfB
	eFlrbScnz4PzI0qVvsQpV3tXGEOPpOKFsWGkj1XCRyQh53zbfRotmv2zXIi2u88a
	Xd59LHd163DIiHSM7po1chaNXkRsRL34+flAQ2A8NqG+zJNLfQ8fFc7uI85QfDfD
	HrVffzFWmgDZvUlQbtN3foOPXRII6HxdP0cI9L4VDkoafvRkZAeumYbWCow+A9A8
	7iSdIub16pWxeItJax90BHZ2N/4Egt94K3HCOF93m9L2xLWM8gzZpbLHpthXAjTs
	h11Htpty57DUByYBTCi8NXGS15VWSaRhHdOWlaY1KO/Ct7ja63mvyixCJe/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1711442171; x=1711528571; bh=RqUnATFnkN/atbi2LoUUzmsvRFTW
	nDKu2pDJucNkCR4=; b=MNoZPwLR/NwsYxqflD8oQxvC1KerJuXmT4+NJAiWzC3i
	cVGHWQfy2OmcDcqJhjEkhh3s61V1UDnik2cVD4tsxyqJMgo+qtEwyKy9BpFeu8vG
	9JHstZzZ/ZM512MaMGWO7wBDsbrnXpVWfb8RLMWoTXNgtoTY0K59kdx8nVT0swvY
	9tBE8dtljhFcM7Y1mdGib+Q3xQuhtsGFyYqA46SH130sODGBAD7xYKbKgXUeNZQA
	ZUdNcrMllwtRtZkzoWQuoE/lTV5POVJk7MXhWH5kwEvJzi0Ih7WuWZpzc449PwUy
	n3RcLmicfqReW/oPldL60Ct4+rnRpwlicVfnwGHh5Q==
X-ME-Sender: <xms:-ogCZlPwGJ_X9lklX7GNaxsVlELV6qfQZtI16f83La9sT0BfzKlo9w>
    <xme:-ogCZn8BA_RzDtgLJe6ARW-VOUqUvnxbzl7ZTXrHeiY3UfTDBCsGM3COe7M088bQh
    lNMeM_z5koDpDutxDM>
X-ME-Received: <xmr:-ogCZkQVFBNVQRPNAtgiMfHVODabMYxbuta9lt-khPFPceiCnn_2D-godSL3lLWLlrJjR1pBgbvCPz4ULWxy8xxzFA_ja9yxow>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudduvddguddvvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttdejnecuhfhrohhmpeflrghn
    nhgvucfirhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnh
    epgfdvffevleegudejfeefheehkeehleehfefgjefffeetudegtefhuedufeehfeetnecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhgrnhhnvg
    esjhgrnhhnrghurdhnvght
X-ME-Proxy: <xmx:-ogCZhuSOwJ0VtGkTfw_jwMXyxa4MxV9Ch38oG7r-px0Xpgw0SI5_Q>
    <xmx:-ogCZtc7yc9zbv8jdJ57qlyJUTK047oa4pGU31UGQIRMo3TBYtLXYg>
    <xmx:-ogCZt1AjGHSmRqqS97CPm2T9-yFjHbLxA0jTCsdUCMmCIa0DS399Q>
    <xmx:-ogCZp-9V297mM7_CKr1wFnoFUbZrBqWDtnhpCBMpfB3dbEB1pErbg>
    <xmx:-4gCZuVxYqJHfgOTbR2wlS9DX07wmJnIAIrsH-3HqjA4Y2AlL-QQIQ>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 26 Mar 2024 04:36:10 -0400 (EDT)
Date: Tue, 26 Mar 2024 09:36:07 +0100
From: Janne Grunau <j@jannau.net>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: u-boot@lists.denx.de, asahi@lists.linux.dev,
	Neal Gompa <neal@gompa.dev>, Bin Meng <bmeng.cn@gmail.com>,
	Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
	Simon Glass <sjg@chromium.org>,
	Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [PATCH v3 2/6] usb: xhci: Set up endpoints for the first 2
 interfaces
Message-ID: <ZgKI9y4RITeAgAKj@robin>
References: <20240322-asahi-keyboards-v3-0-3106dd4c4e19@jannau.net>
 <20240322-asahi-keyboards-v3-2-3106dd4c4e19@jannau.net>
 <082bfd68-1dd4-4bc5-acb3-1000de1a19b8@canonical.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <082bfd68-1dd4-4bc5-acb3-1000de1a19b8@canonical.com>

On Fri, Mar 22, 2024 at 09:17:08AM +0100, Heinrich Schuchardt wrote:
> On 3/22/24 08:47, Janne Grunau via B4 Relay wrote:
> > From: Janne Grunau <j@jannau.net>
> > 
> > The xhci driver currently only does the necessary initialization for
> > endpoints found in the first interface descriptor. Apple USB keyboards
> > (released 2021) use the second interface descriptor for the HID keyboard
> > boot protocol. To allow USB drivers to use endpoints from other
> > interface descriptors the xhci driver needs to ensure these endpoints
> > are initialized as well.
> > Use USB_MAX_ACTIVE_INTERFACES to control how many interface descriptors
> > are considered during endpoint initialisation.
> > For now define it to 2 as that is sufficient for supporting the Apple
> > keyboards.
> > 
> > Reviewed-by: Marek Vasut <marex@denx.de>
> > Reviewed-by: Neal Gompa <neal@gompa.dev>
> > Signed-off-by: Janne Grunau <j@jannau.net>
> > ---
> >   drivers/usb/host/xhci.c | 31 +++++++++++++++++++------------
> >   include/usb.h           |  6 ++++++
> >   2 files changed, 25 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> > index 534c4b973f..741e186ee0 100644
> > --- a/drivers/usb/host/xhci.c
> > +++ b/drivers/usb/host/xhci.c
> > @@ -606,24 +606,28 @@ static int xhci_set_configuration(struct usb_device *udev)
> >   	int slot_id = udev->slot_id;
> >   	struct xhci_virt_device *virt_dev = ctrl->devs[slot_id];
> >   	struct usb_interface *ifdesc;
> > +	unsigned int ifnum;
> > +	unsigned int max_ifnum = min((unsigned int)USB_MAX_ACTIVE_INTERFACES,
> 
> no_of_if being of type u8 limits the number of interfaces to 255. 
> Introducing USB_MAX_ACTIVE_INTERFACES limit us to the first two 
> interfaces. Is this really needed? Handling all interface would avoid 
> the introduction of artificial limitations which may hit us on the next 
> device.

It's not strictly necessary but assume that the code was only tested
with a single interface. Given the general state of u-boot's USB stack
I wouldn't be surprised if it would blew up with USB descriptors maxing
out the number of interfaces / endpoints. So limiting it to the minimum
of what's needed to support the device in front of me looks like the
safer option.

Janne
