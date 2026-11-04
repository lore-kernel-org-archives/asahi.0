Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793805902;
	b=ohCUgM+7ZVVvMnux816rVQux19D5T5LZTkfvXESSxSxyT2yd6DFeNEqih1D98TStyTJ2
	 FScwz0PhLEm99GuhnzNEBoP/kZOw6udqMHG7yGIpDGtGQzIUZsxx9j/bSKFeNA1Kqdskw
	 JGZtcEu2ulxL7ArRt2csj/x7Fxa59I0ijrYsh3Q7gD3n481xo+WeNVZKgEZpD6Ri9qyrV
	 2qPFacjrclraShhnjxPwqSx0t9Asm/JZAzNwlIpCPEPNEvei5ZJrzZtgr0RyKJXJNjc6i
	 oZM1KbVL7cUbXZx+vfVE/f2u0aGAE5utwJnm/98A1v4vCsBzfLybK6AMwNGPOOlzWoQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793805902;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FQAPIWMbbJdCSrqpLgLYAqpkKK9TOoJ/Jv2La7z0jSE=;
	b=1+a+14pGW15Z1pOM/ul+hehjm+tVVQ7HBZEd5Mg/3aZqq+vYD48HLJcDH7Bkzr0Cpj4V
	 cf2bucymG35ihQJj6N8je5K8uh/SUvdYto+IFlG20TQ5qKHRZ67LEW8GuSryKBbuqXzfD
	 wQky4xsi27fXy4ogIViIzjLH8KcTwZPKWBLGKf3GRUgirfHNnE8WnoZfnMyOpRghRtsnV
	 QKYByeKSaRy2x8mw8nNA3YbpNiKwu/AXpzNrZVPYv0io8VzVWygQ1trobkLsrc1a8S3MV
	 CZiRvbEoa7rzH1LjP6qAjLl/GJTVo2ijk22DkRW/hz4oc0H+Qd743Ya8tOO4VxhVIZA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=So3+xodJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.179
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19858606A328
	for <asahi@lists.linux.dev>; Wed,  4 Nov 2026 15:25:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19858606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=So3+xodJ
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-5058b105df7so298601b6e.1
        for <asahi@lists.linux.dev>; Wed, 04 Nov 2026 07:25:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793805901; cv=none;
        d=google.com; s=arc-20260327;
        b=CL437rgBO/XTDvMXHE/yzPoMqrGBvJ2nf2d58RIACJJAkZLc9aj9t19pkO+RaSfDW3
         7Stu/IYWHyOQmI3HYWS8L/QvMoCIElTXjiHH1Bes5Ql8K2NbrB4IlcY4sJpcwXpF7ZPV
         XefJ2mlncasrkP+je/RyqbckJrep63TjCUPVWfu/R6FFoKzgErUfisuJLwedZptKakBI
         cT9y0v8KHGwnCWZSOZwMLl/RuAnm6KHPw1Cs337kfMzonenz50t8Nhjvg/DEyZxFsV06
         LRtKUhcvo0mCeD+GC7DKn7VnkQmDKehmHu2ghLuhm+NtTuBsKFr7kX8WKpK+PEzWw9Kc
         caGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FQAPIWMbbJdCSrqpLgLYAqpkKK9TOoJ/Jv2La7z0jSE=;
        fh=AOBXGlNR1zwoIp+5bmDkSdFNHAfO7voinSaZrQbTEPQ=;
        b=HsdMe01kHtPXEYH7n1ZMWp/LmoZxEgwt4J2C/QeG/085rS6z5zyFK9JQKo0R+pva+d
         5Pmtd4ofZl9jSOmU1JZDyvofiCeUYcu+e1fj0bEr9KCgjg+uAo4v7qJSpLKS93DFDKbb
         FrjfKeR4YXH63mSyrgOaqFukRjMThkUSlMiwYwhjKF4ChZ4YALv4nV0Oa6erCpfiLpC5
         yqurkyC8WZJb2i4RpnSsiFCaUPrN5jReOFHbTRrVsJpmXkNadxF+8SiJfsReUIdP5SaI
         mtpRx+DYZWDFvTG1QupYSJQu15DEM0DLhTfgspMmleHXKYRNJzd8LWlGJVj522xHmeNZ
         R6uw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793805901; x=1794410701; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FQAPIWMbbJdCSrqpLgLYAqpkKK9TOoJ/Jv2La7z0jSE=;
        b=So3+xodJ6mDoz1RnVhMcqVgKz5XqPktjkEllXo6A7+pdKqmEpngZlhgmEWCzY26LPb
         6nBA7lIpG89GBO0hGSrXKSPokdxmY0ESfOYyx/S4+5DRhnnCbnQCM13bEyLgk2gna7DL
         NpRNNhS/M5m97iyoACdh+/V4MkTbu+qrhrf294JX7tR2AsaaZqH8LY75XNOBovtDsMfM
         LXKNh4ezamB4+4RN6ywm61cuOAptx/6LZbqvWWFX+b3wqViXoLroZBHH9c107zw6DFxl
         jTJyqxw1fD8O/ogkMFai9wIrhuWYAtbWHEflTqoM9qCAduvzXpowtORa4lwQgf6UGB5J
         B34g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793805901; x=1794410701;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FQAPIWMbbJdCSrqpLgLYAqpkKK9TOoJ/Jv2La7z0jSE=;
        b=k6TXvD/JxnGkLsXzILPh9O2E0gTLVeg1dIX4Ruh0Pj5FdggybVRsoqOCX9h6BKscCF
         ecaiwEk+bi7bGyFvjNS0TZlBNLdS7bVXnmQ8xcK34YUzzw3ZARKQsdklGWZWLfZGXC/V
         Yu7ATWCCU02I/NA5Ad6ddfGRvifQHPQU0GtW76WsHLcNClNZXoEc5bEoEjqyjuY8KDvj
         NbqPEB8YvSbmMy6KtoYaIPAHmQhxWMYHvRo/CwqSat2Cn9zzOn6DwgD0nquaeQqzbkAl
         8d7MJXL8XyVwenu5xff1zKPAgqU5M1E6xzBodJE37GlSQR/Y5xDZge+qTtx0cOS3vaWL
         KTMg==
X-Forwarded-Encrypted: i=1; AKwUvBzE/TilZJbTlFDP3TudW+fpTSnY0Ls7CHVJ4kac8X/YZiz5GDQ7fAyNs4Zqy5xY5BVXv+nnFA==@lists.linux.dev
X-Gm-Message-State: APuU4Z9hgar8zWNdTVEG0xDt45nQY6z37Om71BFVw8TTuTzaDKHb8+za
	DUoAl1+9edZpsgAfAf7GRVYKf9k4qlh52WOQBA9V6ioUWVLC2tTHMg7W/VRGzzZAUD1eF5WYx1/
	mAQnNS2j3WFx83dCcmfqo8qtlTidMq64=
X-Gm-Gg: AYBFou149HhBTVKbYUkY53gZ6QMQPMs4FJCfyHMMjp3s7HUcKWfjDV/UAZVefqVzn7G
	CfDNzzQv1KG3R/IrI5G3X0yFRYyLeHOwdy40L/14My0oS38d4FBm2DGD6lmAmGWv1q8yKACC4w9
	t7ab1UE+rHoiy0BobX7IUiQg9YYoNK1RV6sl9CULbN5QRyHs3PO1QXO2oGmBJ7NbVtaLK5joUie
	ZltAbhvTxKkCUdK5d9M3voGRRsIIXaec7PHSZcxz5XjrGL884C7cftocal2tCnncF7+j2A/ea6C
	jx5gtEG0EoGCGqs+L5lrPQpHBVgNEofZxIKl8VKj4COT7q+Fdz/YKTicdmfY5C5+6hzjBxTNaka
	7qQsfc04QYV69SbzFpfO/RwEXothfus/YDHE93/mC0ZF65bvvR+z1jAkcEcEag3Ef+JClkgLl+y
	9WJ7FwLq/Lc6AbNjFB0VMJjRyzhbxtn7qetgfGF5CSffoVw+iM/SgERCgE
X-Received: by 2002:a05:6808:23d3:b0:552:2c0b:905f with SMTP id
 5614622812f47-5640dc2c531mr11109420b6e.10.1793805900632; Wed, 04 Nov 2026
 07:25:00 -0800 (PST)
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261104151601.70493-1-dev@deq.rocks> <20261104151601.70493-3-dev@deq.rocks>
In-Reply-To: <20261104151601.70493-3-dev@deq.rocks>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Wed, 4 Nov 2026 10:24:47 -0500
X-Gm-Features: AclHuK8hxLtpKa8aXaTi7mu-MijqC4C86dfWCBKmhN_R5OdoXiTiEBf1-KSgMMk
Message-ID: <CABBYNZLMVso40XpULwTwBwAE4tpXndSJMKhmoVLrmgm+unBNCA@mail.gmail.com>
Subject: Re: [PATCH 2/4] Bluetooth: btbcm: clear vendor bits in LE advertising
 report types
To: Andre Eikmeyer <dev@deq.rocks>
Cc: marcel@holtmann.org, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, sven@kernel.org, j@jannau.net, neal@gompa.dev, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	66ton99@gmail.com, josemiguelo.ochoa@gmail.com, aditya.garg@linux.dev, 
	Yossef Osman <Yossef.Osman@proton.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andre,

On Wed, Nov 4, 2026 at 10:16=E2=80=AFAM Andre Eikmeyer <dev@deq.rocks> wrot=
e:
>
> The BCM4364B0 of the MacBookPro15,1 (UART) and the BCM4377 of the
> MacBookAir9,1 (PCIe) set bits 4, 5 and 7 of the event type in LE
> Advertising Report events. btmon on the 15,1 shows types 0x10, 0x13,
> 0x14, 0x20, 0x23, 0x24, 0x93 and 0xa0 next to plain 0x00, 0x03 and 0x04,
> the same advertiser shows up as 0x13, 0x23 and 0x03. The kernel log of
> the 9,1 lists 0x10 to 0x24 and 0x80, 0x83, 0x90, 0x93, 0xa0, 0xa3.
> process_adv_report() drops every type above 0x04 with "Unknown
> advertising packet type", so most advertisements never reach the host.
> An AirDrop sender was reported as 0x23, 0x23 and 0x13 and only the
> fourth report, 0x03, reached BlueZ 32 s after the first one.
>
> Add btbcm_fixup_le_adv_report(), which clears the bits above the type,
> and call it from hci_bcm on Apple machines and from hci_bcm4377 before
> the event goes to the core.
>
> Suggested-by: Jose Miguel Ochoa <josemiguelo.ochoa@gmail.com>
> Tested-by: Yossef Osman <Yossef.Osman@proton.me>
> Tested-by: Aditya Garg <aditya.garg@linux.dev>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
> ---
>  drivers/bluetooth/btbcm.c       | 30 ++++++++++++++++++++++++++++++
>  drivers/bluetooth/btbcm.h       |  5 +++++
>  drivers/bluetooth/hci_bcm.c     |  5 +++++
>  drivers/bluetooth/hci_bcm4377.c |  1 +
>  4 files changed, 41 insertions(+)
>
> diff --git a/drivers/bluetooth/btbcm.c b/drivers/bluetooth/btbcm.c
> index 0facfe62333..527a5c75fd6 100644
> --- a/drivers/bluetooth/btbcm.c
> +++ b/drivers/bluetooth/btbcm.c
> @@ -282,6 +282,36 @@ void btbcm_set_acl_priority_on_connect(struct hci_de=
v *hdev, struct sk_buff *skb
>  }
>  EXPORT_SYMBOL_GPL(btbcm_set_acl_priority_on_connect);
>
> +/* The BCM4364 and BCM4377 of the T2 Macs set bits above the event type =
of LE
> + * Advertising Reports, 0x13 and 0x23 for ADV_NONCONN_IND for example. T=
he
> + * core drops reports of unknown types, so clear them.
> + */
> +void btbcm_fixup_le_adv_report(struct sk_buff *skb)
> +{
> +       struct hci_event_hdr *hdr =3D (void *)skb->data;
> +       struct hci_ev_le_advertising_info *info;
> +       u8 *p, *end;
> +       u8 num;
> +
> +       if (hci_skb_pkt_type(skb) !=3D HCI_EVENT_PKT ||
> +           skb->len < HCI_EVENT_HDR_SIZE + 2 || hdr->evt !=3D HCI_EV_LE_=
META)
> +               return;
> +
> +       p =3D skb->data + HCI_EVENT_HDR_SIZE;
> +       if (p[0] !=3D HCI_EV_LE_ADVERTISING_REPORT)
> +               return;
> +
> +       num =3D p[1];
> +       p +=3D 2;
> +       end =3D skb->data + skb->len;
> +       while (num-- && p + sizeof(*info) + 1 <=3D end) {
> +               info =3D (void *)p;
> +               info->type &=3D 0x0f;
> +               p +=3D sizeof(*info) + info->length + 1;
> +       }
> +}
> +EXPORT_SYMBOL_GPL(btbcm_fixup_le_adv_report);

I don't think I agree with this being cleaner then doing at
hci_event.though; not only is it more code but it also walks the
packet which is inefficient and may have security implications as
well.

>  int btbcm_patchram(struct hci_dev *hdev, const struct firmware *fw)
>  {
>         const struct hci_command_hdr *cmd;
> diff --git a/drivers/bluetooth/btbcm.h b/drivers/bluetooth/btbcm.h
> index a4d47b242e9..56936e64b5f 100644
> --- a/drivers/bluetooth/btbcm.h
> +++ b/drivers/bluetooth/btbcm.h
> @@ -60,6 +60,7 @@ int btbcm_write_pcm_int_params(struct hci_dev *hdev,
>                                const struct bcm_set_pcm_int_params *param=
s);
>
>  void btbcm_set_acl_priority_on_connect(struct hci_dev *hdev, struct sk_b=
uff *skb);
> +void btbcm_fixup_le_adv_report(struct sk_buff *skb);
>
>  int btbcm_setup_patchram(struct hci_dev *hdev);
>  int btbcm_setup_apple(struct hci_dev *hdev);
> @@ -101,6 +102,10 @@ static inline void btbcm_set_acl_priority_on_connect=
(struct hci_dev *hdev,
>  {
>  }
>
> +static inline void btbcm_fixup_le_adv_report(struct sk_buff *skb)
> +{
> +}
> +
>  static inline int btbcm_setup_patchram(struct hci_dev *hdev)
>  {
>         return 0;
> diff --git a/drivers/bluetooth/hci_bcm.c b/drivers/bluetooth/hci_bcm.c
> index cf4f1455cf9..1ae9619ee1e 100644
> --- a/drivers/bluetooth/hci_bcm.c
> +++ b/drivers/bluetooth/hci_bcm.c
> @@ -148,6 +148,7 @@ struct bcm_device {
>         bool                    no_uart_clock_set;
>         bool                    use_autobaud_mode;
>         bool                    acl_priority;
> +       bool                    adv_type_fixup;
>         u8                      pcm_int_params[5];
>         u32                     max_autobaud_speed;
>  };
> @@ -686,6 +687,9 @@ static int bcm_recv_event(struct hci_dev *hdev, struc=
t sk_buff *skb)
>         struct hci_uart *hu =3D hci_get_drvdata(hdev);
>         struct bcm_data *bcm =3D hu->priv;
>
> +       if (bcm->dev && bcm->dev->adv_type_fixup)
> +               btbcm_fixup_le_adv_report(skb);
> +
>         if (bcm->dev && bcm->dev->acl_priority)
>                 btbcm_set_acl_priority_on_connect(hdev, skb);
>
> @@ -1100,6 +1104,7 @@ static int bcm_get_resources(struct bcm_device *dev=
)
>
>         if (x86_apple_machine && !bcm_apple_get_resources(dev)) {
>                 dev->acl_priority =3D true;
> +               dev->adv_type_fixup =3D true;
>                 return 0;
>         }
>
> diff --git a/drivers/bluetooth/hci_bcm4377.c b/drivers/bluetooth/hci_bcm4=
377.c
> index 30fcadfae3f..8d99a7a8f76 100644
> --- a/drivers/bluetooth/hci_bcm4377.c
> +++ b/drivers/bluetooth/hci_bcm4377.c
> @@ -691,6 +691,7 @@ static void bcm4377_handle_event(struct bcm4377_data =
*bcm4377,
>
>         memcpy(skb_put(skb, len), payload, len);
>         hci_skb_pkt_type(skb) =3D type;
> +       btbcm_fixup_le_adv_report(skb);
>         btbcm_set_acl_priority_on_connect(bcm4377->hdev, skb);
>         hci_recv_frame(bcm4377->hdev, skb);
>


--=20
Luiz Augusto von Dentz
