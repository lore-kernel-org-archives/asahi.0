Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9799247FB10
	for <asahi@lists.linux.dev>; Thu, 13 Aug 2026 15:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786633717; cv=none; b=NmvZmnghCh+WylbWtFUxAGXUdyT06oTFMjj9XImoXg44ss9m+eAJxD7jx0UHCOgw2HEXB7udhNYm/rlhp8lFjoK5PmflHkl/ydZe5WgbyabCx7ouPh43wwWOhSj65gt89/UpMJVxLhVGXGxh7eH/7imQWhCJ7uFAI75gsNUGk/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786633717; c=relaxed/simple;
	bh=znX1PEo6VXqBV0lnd6kbET2xss7FSygNH1IGnqu87K0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H5VYQbiv0i29jhY6mxKIwKJGArBN+hrZMLGCI9zKuiPFCYy9xb92hk3qYUmPlFADsgngeVE+wGfgsO+mYZ1zq6n5hn9pajxXKZQ4lC0VEi3IuCQdNWRAoh4xVegnfCXTCqWBe9Ppf2heBk83HV11fm8Qtm5nqdf9/R3bGOTle8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fzNO0zX/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fzNO0zX/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786633714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=znX1PEo6VXqBV0lnd6kbET2xss7FSygNH1IGnqu87K0=;
	b=fzNO0zX/fvgW2UEH2ij9ZudPKdhIY5q8Bm7VAM0F+nGTFNo0RURuazTvI7PPOJBucK9vhL
	0rbS2vvOXzSqlmYb28xQ4SpSKQuhLSWO+sDaTJkVoMQXIVr/8joRonm/+7wXP/rdTLVqWP
	p+wk8FQ2JLqX3UFxeiXpY5Lp0D6WVGs=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-LSoW1Z_INGGLEBMe-BCVWA-1; Thu, 13 Aug 2026 11:08:27 -0400
X-MC-Unique: LSoW1Z_INGGLEBMe-BCVWA-1
X-Mimecast-MFC-AGG-ID: LSoW1Z_INGGLEBMe-BCVWA_1786633707
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3931cd2e4cbso1495077a91.2
        for <asahi@lists.linux.dev>; Thu, 13 Aug 2026 08:08:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786633707; x=1787238507;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=znX1PEo6VXqBV0lnd6kbET2xss7FSygNH1IGnqu87K0=;
        b=sPBbNgC1XM5jvOjSIKEO3zdt+Y/pRPWUND754f/hlbWGTCT9qCzLZaFggVA56BV6xc
         miNhmsPSm1n6UKA/YQcF8fTGNM9vSGHv8HO2UtYi+rhStlnt1jjkTf0Gla3l6GYsv53y
         tdIjIcqy5jKwt5nq9h0hCjoL+CuMhOf6uj5LzRmtYy7GFV6SkdWi3o9AWwSr2Fx+Kiv+
         t1qNRTmuzLrurx3Uq8Jl+CA1w+e2o2oLUlgI2rO1tRdP8ToqZgAGo68qSEN0RjVUngOd
         4ffuc3mjD0UyFbKVUDjrVK/tN/Fldmi6nefuQdjsxVUBgNwv4Y6vNvTSBeL6EW0le40m
         flLw==
X-Forwarded-Encrypted: i=1; AHgh+RoPsha+rv5zi6hABGHZyigjwit4hr525Yi4CdqpMvvjuKc1y/Hhys5PF65qk7QhXdvhY1uqsw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwjcNHMurGF6slC1++L+0YBBxofCHct1dMWSPL+KOnJ0C1lnqXv
	Q5CGbaQgzXdjAcK9wCp1wwBYiSLOcjIfUxhzZWi04u4bP9muEcC5WCG+rC1VusYv1IySDybrIwa
	bvett4xiU7LH/3C3rSQIWIwXBO8DtXb9PgOcwMfSKZRwo1Qz2hhZYKwt72mJAcpz32CYGe25eSp
	BpReksA0Cc1JrN+ecgCZzZiqn+tqVzX2I=
X-Gm-Gg: AR+sD11Pu/KLFpOuTfSLsJ1Gaaz6sojNcZngKL9XaomIceuXw3Y7WIxkRsLmJM2kTKV
	44qVfPzjVGZQFFmauR1Cpc1x/MxEF9e1+Uz4meIIr3JrzU2fg1LvC2uDub0N8//7hm8PAJQdu4z
	dbmQdrb01jiGglx+yQ8rWPiw2eMpHSA4rdKJe1dA92dcqVAgkj5sHZCzjdma/I+7Wor5Cb6wQYV
	C0TL7ekPQqxLYcs
X-Received: by 2002:a17:90b:1d4c:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-3931de23128mr7864573a91.0.1786633706558;
        Thu, 13 Aug 2026 08:08:26 -0700 (PDT)
X-Received: by 2002:a17:90b:1d4c:b0:366:3517:1aa2 with SMTP id
 98e67ed59e1d1-3931de23128mr7864179a91.0.1786633704531; Thu, 13 Aug 2026
 08:08:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <92fe4dd4-21a4-4559-8441-32ef86672de6@app.fastmail.com>
 <ZrclLHJ63RxnG/B3@w1.fi> <d82c88a2-77f7-4308-97fa-c5b4446e2cf5@app.fastmail.com>
In-Reply-To: <d82c88a2-77f7-4308-97fa-c5b4446e2cf5@app.fastmail.com>
From: Davide Caratti <dcaratti@redhat.com>
Date: Thu, 13 Aug 2026 17:08:12 +0200
X-Gm-Features: AUfX_mxamdxmLPDi1biA04ECKG69tiX9wZJ8IYEuvifW43ahJhc54qnV0-aVrEs
Message-ID: <CAKa-r6urmeg7YR45XCzEHFhhHPgq-h5x0NjaVT0tu67_BHBwgQ@mail.gmail.com>
Subject: Re: wpa_supplicant 2.11 breaks WPA2-PSK / WPA3-SAE authentication on
 Linux' brcmfmac
To: Janne Grunau <j@jannau.net>
Cc: Vinayak Yadawad <vinayak.yadawad@broadcom.com>, Aditya Garg <gargaditya08@live.com>, 
	"arend.vanspriel@broadcom.com" <arend.vanspriel@broadcom.com>, asahi@lists.linux.dev, 
	chung-hsien.hsu@infineon.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: q72LBZhMl2rWDWj_4hGxawTd2hWPgIeDZyNN-0Jx5lE_1786633707
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

hello,

On Sat, Aug 10, 2024 at 11:18=E2=80=AFAM Janne Grunau <j@jannau.net> wrote:
>
> Hej,
>
> On Sat, Aug 10, 2024, at 10:30, Jouni Malinen wrote:
> > On Sun, Aug 04, 2024 at 02:23:56PM +0200, Janne Grunau wrote:

[...]

> >> I've bisected this to
> >> https://w1.fi/cgit/hostap/commit/?id=3D41638606054a09867fe3f9a2b5523aa=
4678cbfa5
> >> "Mark authorization completed on driver indication during 4-way HS
> >> offload". Reverting this commit on top of hostap_2_11 properly
> >> authenticates the connections. Looking at that change and the code it
> >> looks clearly broken to to me. As far as I can see is
> >> `assoc_info.authorized` for the nl80211 driver only set when
> >> QCA_WLAN_VENDOR_ATTR_ROAM_AUTH_AUTHORIZED is set (in main, I did not
> >> check older revisions). This doesn't seem appropriate to expect this
> >> on chipsets from different vendors.
> >
> > This commit is from Broadcom to fix some race conditions with the 4-
> > way handshake offload which I'm assuming is for a Broadcom driver..
> > Whether that is for brcmfmac is unknown to me, though.
> >
> > It looks like the goal here was to move completion of the connection
> > from the association event to EVENT_PORT_AUTHORIZED, i.e., the
> > NL80211_CMD_PORT_AUTHORIZED event from the driver. Is that event not
> > delivered by brcmfmac? I did not see any full wpa_supplicant debug
> > logs for these issues based on a quick look, so I could not check
> > that myself.
>
> The following place in brcmf_bss_roaming_done() is the only place where
> NL80211_CMD_PORT_AUTHORIZED event is posted.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/d=
rivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c#n6402
>
> In my initial analysis I missed that the NL80211_CMD_PORT_AUTHORIZED is
> delivered directly to wpa_supplicant.
>
> >> A revert looks to me like a possible/proper fix. I can send that
> >> later if no alternative materializes.
> >
> > I'm inclined to revert this if it is indeed the case that
> > NL80211_CMD_PORT_AUTHORIZED is not delivered reliably by the upstream
> > driver and this commit was tested only with some non-upstream
> > versions.
>
> I intend extend the upstream kernel driver to post
> NL80211_CMD_PORT_AUTHORIZED after successful connection with
> authentication offload. I expect that the change will be accepted for
> the stable kernel. Infineon/Cypress have non-upstream patches for the
> brcmfmac driver which implement it already.
>
> A revert in wpa_supplicant might be still appropriate until exteded
> kernel drivers are deployed. The wpa_supplicant Fedora package carries
> the revert as patch:
> https://src.fedoraproject.org/rpms/wpa_supplicant/c/c2eac195adadd2c48b04f=
8752cc46b12a351e69c

hello,

(stripped some of the receivers in the original thread)

wpa_supplicant 2.12 is out, including some security fixes [1] and the
above-mentioned revert patch didn't apply anymore: upside context
mismatched becaue of the addition of OWE offload [2].

I adjusted the revert patch [3] so that it applies also to OWE offload
setups, but I'm not sure that:
- revert code is still needed
- revert code should also cover OWE offload, or just 4-way-PSK

and I can't even test it here because of missing brcmfmac hardware.
Hence, I would really appreciate if you could do some preliminary
testing before I hit the 'Merge' button. Any suggestion / any
feedback?
thank you in advance!
--=20
davide

[1] https://w1.fi/security/
[2] https://git.w1.fi/cgit/hostap/commit/?id=3D3602f8905
[3] https://src.fedoraproject.org/fork/dcaratti/rpms/wpa_supplicant/blob/b1=
d2522596c46ccbe6aea70c5bf063c6707fadec/f/wpa_supplicant-Revert-Mark-authori=
zation-completed-on-driver-indica.patch

