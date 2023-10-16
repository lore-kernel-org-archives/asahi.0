Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B95A1F60F
	for <asahi@lists.linux.dev>; Mon, 16 Oct 2023 10:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RrrHHOlF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697451741;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Gp85qeDzi8U6mzQo/nR8ijZYIV2Eq5Pjoam1JtOSHss=;
	b=RrrHHOlFPb/gmMduqCjs2g5hdWukDESpplE+dxBmMxG0qB3mQKqdCrkpHhDUyAC8KXk1os
	/VAeBvNmL2c5mJ1qa72q9y104xHPUOldAJS772UytzwW6JxqFl8pEq1r5/Mwj0/w2W9LZe
	Q/v766tSV2i0BXeY9qU05aYGV/b+LbY=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-265-u38o10k3MQiA2Wmr0exS0Q-1; Mon, 16 Oct 2023 06:22:18 -0400
X-MC-Unique: u38o10k3MQiA2Wmr0exS0Q-1
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-6b6f4c118a8so2223283b3a.3
        for <asahi@lists.linux.dev>; Mon, 16 Oct 2023 03:22:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697451737; x=1698056537;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gp85qeDzi8U6mzQo/nR8ijZYIV2Eq5Pjoam1JtOSHss=;
        b=Q0iWHhSeiIYZWkLGwMuXbbjt4xVY/v66jLzWjXmggRPvMmsmlpej7OBsvzbrrasyC2
         qTfj13KwQmo1N6xMwG7eh6sJJPJ8MysGuirr179JUcrxsRRl3vyxC1vZjjpdnibyCD1c
         +gdlVPAl/vg5c9JpcutCwBsjoGVJ0DULTVYqNmAvPBDDttAPDwAZl/MDkWms9N0ELKYT
         MRRFvbfe+8+0hJugT6TXlu2D2iYs2lA6AteIgWii0/cyIabMw88sQ9LnR6b+tbKrBp4G
         ENR1XbiyM5rEinIjUWh7KH4S1UeNEIPNBoAgqkUvqdpJvJv8uSebDhlBJi+aXcoHSgbS
         sccg==
X-Gm-Message-State: AOJu0Yz+PU9gOhJfUmNUUYRZEhI2zTE6ds1+MjYbqwIIiZ6+ZWA2juj1
	WZCTJsHz0uHH75XXZes0GHKl4jVSC7jlQAkA4f5zYDnUtjtWPbqxcGXrzLZw/J4Q5hMvzT8N0B+
	NqDULUyoRriUbP4vDWXohQtiKYP3hBoI=
X-Received: by 2002:a05:6a21:819c:b0:169:535f:2687 with SMTP id pd28-20020a056a21819c00b00169535f2687mr29186299pzb.49.1697451737413;
        Mon, 16 Oct 2023 03:22:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6NFZbUqAnxzUeRwXsjJ2wD+9lzj4oz8AbfJAYlMT5H+FPNWTMEdzeJdUlW0ZcPPLf3ZC6bpKJ5qo+m110tjE=
X-Received: by 2002:a05:6a21:819c:b0:169:535f:2687 with SMTP id
 pd28-20020a056a21819c00b00169535f2687mr29186286pzb.49.1697451737127; Mon, 16
 Oct 2023 03:22:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231016-bt-bcm4377-quirk-broken-le-coded-v1-1-52ea69d3c979@jannau.net>
In-Reply-To: <20231016-bt-bcm4377-quirk-broken-le-coded-v1-1-52ea69d3c979@jannau.net>
From: Eric Curtin <ecurtin@redhat.com>
Date: Mon, 16 Oct 2023 11:21:41 +0100
Message-ID: <CAOgh=Fxn7Ga7p-FaP-ef=+F1MTFWs-5OOna9piJa-nFcCwe=NA@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: hci_bcm4377: Mark bcm4378/bcm4387 as BROKEN_LE_CODED
To: j@jannau.net
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Marcel Holtmann <marcel@holtmann.org>, 
	Johan Hedberg <johan.hedberg@gmail.com>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev, 
	stable@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Oct 2023 at 08:21, Janne Grunau via B4 Relay
<devnull+j.jannau.net@kernel.org> wrote:
>
> From: Janne Grunau <j@jannau.net>
>
> bcm4378 and bcm4387 claim to support LE Coded PHY but fail to pair
> (reliably) with BLE devices if it is enabled.
> On bcm4378 pairing usually succeeds after 2-3 tries. On bcm4387
> pairing appears to be completely broken.
>
> Cc: stable@vger.kernel.org # 6.4.y+
> Link: https://discussion.fedoraproject.org/t/mx-master-3-bluetooth-mouse-doesnt-connect/87072/33
> Link: https://github.com/AsahiLinux/linux/issues/177
> Fixes: 288c90224eec ("Bluetooth: Enable all supported LE PHY by default")
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---

Reviewed-by: Eric Curtin <ecurtin@redhat.com>

Is mise le meas/Regards,

Eric Curtin

>  drivers/bluetooth/hci_bcm4377.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/bluetooth/hci_bcm4377.c b/drivers/bluetooth/hci_bcm4377.c
> index 19ad0e788646..a61757835695 100644
> --- a/drivers/bluetooth/hci_bcm4377.c
> +++ b/drivers/bluetooth/hci_bcm4377.c
> @@ -512,6 +512,7 @@ struct bcm4377_hw {
>         unsigned long disable_aspm : 1;
>         unsigned long broken_ext_scan : 1;
>         unsigned long broken_mws_transport_config : 1;
> +       unsigned long broken_le_coded : 1;
>
>         int (*send_calibration)(struct bcm4377_data *bcm4377);
>         int (*send_ptb)(struct bcm4377_data *bcm4377,
> @@ -2372,6 +2373,8 @@ static int bcm4377_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>                 set_bit(HCI_QUIRK_BROKEN_MWS_TRANSPORT_CONFIG, &hdev->quirks);
>         if (bcm4377->hw->broken_ext_scan)
>                 set_bit(HCI_QUIRK_BROKEN_EXT_SCAN, &hdev->quirks);
> +       if (bcm4377->hw->broken_le_coded)
> +               set_bit(HCI_QUIRK_BROKEN_LE_CODED, &hdev->quirks);
>
>         pci_set_drvdata(pdev, bcm4377);
>         hci_set_drvdata(hdev, bcm4377);
> @@ -2461,6 +2464,7 @@ static const struct bcm4377_hw bcm4377_hw_variants[] = {
>                 .bar0_core2_window2 = 0x18107000,
>                 .has_bar0_core2_window2 = true,
>                 .broken_mws_transport_config = true,
> +               .broken_le_coded = true,
>                 .send_calibration = bcm4378_send_calibration,
>                 .send_ptb = bcm4378_send_ptb,
>         },
> @@ -2474,6 +2478,7 @@ static const struct bcm4377_hw bcm4377_hw_variants[] = {
>                 .has_bar0_core2_window2 = true,
>                 .clear_pciecfg_subsystem_ctrl_bit19 = true,
>                 .broken_mws_transport_config = true,
> +               .broken_le_coded = true,
>                 .send_calibration = bcm4387_send_calibration,
>                 .send_ptb = bcm4378_send_ptb,
>         },
>
> ---
> base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
> change-id: 20231016-bt-bcm4377-quirk-broken-le-coded-599688e3c4a0
>
> Best regards,
> --
> Janne Grunau <j@jannau.net>
>
>

