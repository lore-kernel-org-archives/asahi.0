Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D80A343893
	for <asahi@lists.linux.dev>; Sat, 12 Sep 2026 09:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789206984; cv=none; b=NmEi/4qz446LR2SXtzrR2UlvopyxvGesu0fvAox71oladvv1L3iGps1gCTl6ypDmXpEDnZ2UNsannFn/UtCzc4hRaWyxiZmrjrFPau3+FNWoY0mIWIN4lzs08orjx8tF/fsyrEu+iBAZsIrqiy9DSB952xety8QQkQ6GjHxEQpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789206984; c=relaxed/simple;
	bh=P+c2kLM+9RIpJi/qwUms2c+Kzant/wPOssUY3FPd0Qs=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=UA4H6fwHyHfbtbJU8dhCNvhYXx/UAMmDl+n3oRYC+YuWf9W1n7DUAr0ucIUfjy56qYZSWYeIceiBIy98KpZxisn8PjM7BfHWLdyFKFpd0kljrFYeN58KqodCBtqk+2qeZycK62CwKyf2SaAKkDh56bTTB3mBaz9bfKeVSPSyI5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=Zr4zziYK; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=a1/26emM; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="Zr4zziYK";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="a1/26emM"
Received: from ams-compute-01.internal (ams-compute-01.internal [10.64.2.61])
	by mailfhigh.phl.internal (Postfix) with ESMTP id B321814000A9;
	Sat, 12 Sep 2026 05:56:19 -0400 (EDT)
Received: from ams-imap-13 ([10.64.2.33])
  by ams-compute-01.internal (MEProxy); Sat, 12 Sep 2026 05:56:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1789206978;
	 x=1789293378; bh=a4YX27d3zOHqX32NMyGtfqo2pFuxb7pt/ZO8j4YvfT0=; b=
	Zr4zziYKV5dmhlLHKCyj3WzsnZtkkXpezbjXD0solY0CpS3bURTaJQOrAFXvJnXf
	ZiD7VMDaTVtwQ6QpopcwLypwrpYNVM4dA7ioBj9LOB0Ku2X6x6gVYLPV2aSyhj+g
	M8Oml+1FGoHvtp6j3pJrLhqo0lJt0DYTMvsZDCQ1Zpo+9CVXJ8wq/fO7jwpSPhVe
	OccAdgX0ZTvdm2LOLSWpYIFU31pjVs9ko99DABn63K1y7S/kZsY4NryPNevpdefV
	bCCUki2AZ59OiUeIe++S9b6iqe/AW5toAmrf+8bPShCib8aW5fyPq5JDWHPGQdzM
	rIoW57skRFV2bUnFS1Tzcw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1789206978; x=
	1789293378; bh=a4YX27d3zOHqX32NMyGtfqo2pFuxb7pt/ZO8j4YvfT0=; b=a
	1/26emM6pu/APuUQP/NgCDAqvDCvLz5Eel6IqIlkE+avYDU5vtI5LxW3bP3oydOs
	tJu3/FebVazRJTZByNHQm4zatOPl2wCImcJOR1RQ8hm9Gv7lMgFV5R3bb6EHhdmF
	8qZLdrlAJd6dw7q1eJ13zDDFtgc0jvuFYSrcJlfsa8jt9Fi/LsVZr3DiRc750qXs
	UAxel6SBqUnWhqGfsNn7DZCjO9BiEz/ZZl/Re91meqjUm/zXwiXEeJvnuzYE/r23
	SxVa0Z7y6aG4O9FwibZMLe9Kvg8lWB5CryhVUf14P1rrozynvugWc+T33kUXJSEu
	q27xfeMB3l/lJNUUWUsfw==
X-ME-Sender: <xms:viGlanzWGCXmrAkOdntYwIWDDhz-zVukBAnasgDzfCJ2e2WHJPf_RQ>
    <xme:viGlaqGOJTpGOruPqOnmYbrufcqNNo4R_0eaZtvNGshoOjGp4XphYN9pMi34HH-b-
    tnpn6q9Sgwfewx9YJV8jyUynFg2flKfvc2PrZYLuh4fZEwPpUJpjki0>
X-ME-Proxy-Cause: dmFkZTGoSvKqVV2QAhp/j4eaU+6M3OraSF1FeCOj2Fg5O0dfvPjzstL6jxOQzCWicvo1Bf
    +90AXR2tTDby4of/RtRak4mOlovzPvE+AhAb+RoEdq/qJxJM6OFCMjZSejtYwCN/qq+T39
    oAAN5J9/8Ksg/ubEZWzf8D2H9R5OGVfz/e5ymDnhgjeABqmXYoMv+1BfRBSFqSwTi5wY+R
    uSKlNU485+x6/uv37k9JC8RTB7uBoL/0KEmFiPk7FcjK+EDuH1bSiz9D5QNFD3ZSoT8m+1
    Y/F01DJuYcxFf4ZNHU/dJqnWCANRtQv49Sen2LWrnW0XVK678CWZgKcUJG+kZrSp6bEofS
    Hie2YbfFFN66kdWj3HUMusn2VyedCmRJ+pzKSg4d3cYkRbmw6+U0qVzBJvjJ6L2Fxr1mtH
    EJLAuf+7IdSvxL/ts6WLLcDzwMwRUdu7uYrA2lu5S4JapFXVb9Rq+izJ6i1xnSZhiYg3WN
    E0YNWVTxSeR6BAWltrkx4Dsu7XsenhCiR7kRd53hfmo6xFt837uBkMq+TEydsXn6Tu/bH2
    5Xw5ZaD6l/Dg+SkKW8jX8796PRoss5qJYOOBmA5GpEPq+16vN03btooJi7VuU93l3C3BFT
    5p0lB17KgwHk0Hm956WnX8vYtwj/M6Iow3flcauVNC5bXxfb2+XO3dTNeLTg
X-ME-Proxy: <xmx:vyGlarf8WhDbJQjqPFjc81ksZ67UbQsuaHrGjVD2qqxn3kIChD3NQg>
    <xmx:vyGlaqhza0QiUw_mvgLLr6vgXGv6OrF6q23qNINrk9GmM145Wc_qOw>
    <xmx:vyGlarz9_mD4wbi3OFz2gcj5uTuYIayZFRxUyEmY1uiJQCWx2XHQkw>
    <xmx:vyGlauMPCeUKANW6liytt1grz18FdNrpCLNtKrSDNAhY05xHs4BM7Q>
    <xmx:wiGlas4vPhxMJNVLWB_vvNxNUuM4y6ODyyl7uocOQM4UDBADPPjslqqM>
Feedback-ID: i47b949f6:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 4D83BF80088; Sat, 12 Sep 2026 05:56:14 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: Ae0et8KTmbP7
Date: Sat, 12 Sep 2026 11:55:54 +0200
From: "Janne Grunau" <j@jannau.net>
To: "Davide Caratti" <dcaratti@redhat.com>
Cc: "Vinayak Yadawad" <vinayak.yadawad@broadcom.com>,
 "Aditya Garg" <gargaditya08@live.com>,
 "arend.vanspriel@broadcom.com" <arend.vanspriel@broadcom.com>,
 asahi@lists.linux.dev, chung-hsien.hsu@infineon.com
Message-Id: <ec08bdf8-dbf0-4426-bb3f-7186013af959@app.fastmail.com>
In-Reply-To: 
 <CAKa-r6urmeg7YR45XCzEHFhhHPgq-h5x0NjaVT0tu67_BHBwgQ@mail.gmail.com>
References: <92fe4dd4-21a4-4559-8441-32ef86672de6@app.fastmail.com>
 <ZrclLHJ63RxnG/B3@w1.fi>
 <d82c88a2-77f7-4308-97fa-c5b4446e2cf5@app.fastmail.com>
 <CAKa-r6urmeg7YR45XCzEHFhhHPgq-h5x0NjaVT0tu67_BHBwgQ@mail.gmail.com>
Subject: Re: wpa_supplicant 2.11 breaks WPA2-PSK / WPA3-SAE authentication on Linux'
 brcmfmac
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hej Davide,

On Thu, Aug 13, 2026, at 17:08, Davide Caratti wrote:
> hello,
>
> On Sat, Aug 10, 2024 at 11:18=E2=80=AFAM Janne Grunau <j@jannau.net> w=
rote:
>>
>> Hej,
>>
>> On Sat, Aug 10, 2024, at 10:30, Jouni Malinen wrote:
>> > On Sun, Aug 04, 2024 at 02:23:56PM +0200, Janne Grunau wrote:
>
> [...]
>
>> >> I've bisected this to
>> >> https://w1.fi/cgit/hostap/commit/?id=3D41638606054a09867fe3f9a2b55=
23aa4678cbfa5
>> >> "Mark authorization completed on driver indication during 4-way HS
>> >> offload". Reverting this commit on top of hostap_2_11 properly
>> >> authenticates the connections. Looking at that change and the code=
 it
>> >> looks clearly broken to to me. As far as I can see is
>> >> `assoc_info.authorized` for the nl80211 driver only set when
>> >> QCA_WLAN_VENDOR_ATTR_ROAM_AUTH_AUTHORIZED is set (in main, I did n=
ot
>> >> check older revisions). This doesn't seem appropriate to expect th=
is
>> >> on chipsets from different vendors.
>> >
>> > This commit is from Broadcom to fix some race conditions with the 4-
>> > way handshake offload which I'm assuming is for a Broadcom driver..
>> > Whether that is for brcmfmac is unknown to me, though.
>> >
>> > It looks like the goal here was to move completion of the connection
>> > from the association event to EVENT_PORT_AUTHORIZED, i.e., the
>> > NL80211_CMD_PORT_AUTHORIZED event from the driver. Is that event not
>> > delivered by brcmfmac? I did not see any full wpa_supplicant debug
>> > logs for these issues based on a quick look, so I could not check
>> > that myself.
>>
>> The following place in brcmf_bss_roaming_done() is the only place whe=
re
>> NL80211_CMD_PORT_AUTHORIZED event is posted.
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c#n6402
>>
>> In my initial analysis I missed that the NL80211_CMD_PORT_AUTHORIZED =
is
>> delivered directly to wpa_supplicant.
>>
>> >> A revert looks to me like a possible/proper fix. I can send that
>> >> later if no alternative materializes.
>> >
>> > I'm inclined to revert this if it is indeed the case that
>> > NL80211_CMD_PORT_AUTHORIZED is not delivered reliably by the upstre=
am
>> > driver and this commit was tested only with some non-upstream
>> > versions.
>>
>> I intend extend the upstream kernel driver to post
>> NL80211_CMD_PORT_AUTHORIZED after successful connection with
>> authentication offload. I expect that the change will be accepted for
>> the stable kernel. Infineon/Cypress have non-upstream patches for the
>> brcmfmac driver which implement it already.
>>
>> A revert in wpa_supplicant might be still appropriate until exteded
>> kernel drivers are deployed. The wpa_supplicant Fedora package carries
>> the revert as patch:
>> https://src.fedoraproject.org/rpms/wpa_supplicant/c/c2eac195adadd2c48=
b04f8752cc46b12a351e69c
>
> hello,
>
> (stripped some of the receivers in the original thread)
>
> wpa_supplicant 2.12 is out, including some security fixes [1] and the
> above-mentioned revert patch didn't apply anymore: upside context
> mismatched becaue of the addition of OWE offload [2].
>
> I adjusted the revert patch [3] so that it applies also to OWE offload
> setups, but I'm not sure that:
> - revert code is still needed
> - revert code should also cover OWE offload, or just 4-way-PSK
>
> and I can't even test it here because of missing brcmfmac hardware.
> Hence, I would really appreciate if you could do some preliminary
> testing before I hit the 'Merge' button. Any suggestion / any
> feedback?

sorry for the late reply. I missed this mail in other hostap mails and
only noticed it after receiving reports that wpa_supplicant 2.12 still
timeouts during authentication.
Unless there is a pressing need to release wpa_supplicant 2.12 (my untim=
ely
reply contributes to this)  I'd recommend not to patch wpa_supplicant 2.=
12
and instead wait until the brcmfmac kernel driver fix made it into stable
kernels.
I finally submitted the fix in
https://lore.kernel.org/linux-wireless/20260912-brcmfmac-4way-handshake-=
offload-authenticated-event-v1-1-e41a6a8281a2@jannau.net/T/
two years later than originally planned.

thanks,
Janne
