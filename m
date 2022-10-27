Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0EF1C13
	for <asahi@lists.linux.dev>; Thu, 27 Oct 2022 18:59:52 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id d6so4082465lfs.10
        for <asahi@lists.linux.dev>; Thu, 27 Oct 2022 11:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sKKXfxrvWBs1+Hg89OKoS0D5bomkbPpDXug7ZUOTYqo=;
        b=C3rMcH37E0tC3a2/wwyFQyS/AaPfokgd48lGNu90AbsNzDMT+NQhQjrLkKiqanEm02
         LVhaBhX+2p5KIH+O95uYRlBM90vO46EKH01y1kX7GLOLRp4rRM9Aga/vTFSSnflfhj6z
         nfeTf6I8U1OwcchAOsZOlxPeQL6K9R5gGANMk6cx0HKtAchyXIE4dJ2WXyhPLqwqP0A6
         +1Ccc23QKGwL/rlvAT+d7NDlX5ZN9owv3H0lrKxVdF9TZaedeNFAyINo7RpCcVYAMVDO
         PrbuSrvK+8jlp7gOWupeCI51j0/2eYkNGkUU9d0KzieC9xPF7Ia1ikhR4rau11UlQh5/
         8A0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sKKXfxrvWBs1+Hg89OKoS0D5bomkbPpDXug7ZUOTYqo=;
        b=zEHQYf5UFWqMkZChYQpbtUFkw5IDPITU7HFBLS5OnsWqDZymZ70+zA1EhrvPiK0nMS
         JWFEAkGIILOhGGuw5eVQTEeuPUMKeoVJcnUSqh7biunmZK4CU7oBvbwgg8iGDnqktyHg
         pLzLJeFCIylz/Oi6FwDjIxrqhyd21qBA22+2u3hosYbKoXJ+US61TV6Pz8zQ7+RLtnr5
         HcgmOrrxj8VfUwMZlTp9KcVZBfVN4XSgIoGuwJSa3VhIeX119oIdh1/W8bpyKnybEvVQ
         xaU3WUyjMwgs56koU0OR6kvmLFe5N6f5+8o+B1mD0YIN5ikzsJZ6Qbazik3IWE8eSVMx
         /5vQ==
X-Gm-Message-State: ACrzQf2oryXVCSqVVJ3Qj9xKVwlVJK/aTZoJreU/VFWxDoemPhkPFU2U
	IRnAcI0hu6ELXZJLEf6pYPIvNiebUjFveD/Ie7M=
X-Google-Smtp-Source: AMsMyM55BByl/DxbuZBmfmXxteUNIOLPRPgsHlOnNe8MUHvu3Tud4uluqbEsdWFvDVZytpdWa4vy0oC8fK7/fGiHJQ0=
X-Received: by 2002:a05:6512:483:b0:4a2:6905:dfae with SMTP id
 v3-20020a056512048300b004a26905dfaemr19431686lfq.57.1666897189900; Thu, 27
 Oct 2022 11:59:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221027150822.26120-1-sven@svenpeter.dev> <20221027150822.26120-7-sven@svenpeter.dev>
In-Reply-To: <20221027150822.26120-7-sven@svenpeter.dev>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Thu, 27 Oct 2022 11:59:38 -0700
Message-ID: <CABBYNZKJnmfWfvxdgpxNFUGc7jTKP+BGv6CiZc2MsR970L35MA@mail.gmail.com>
Subject: Re: [PATCH v4 6/7] Bluetooth: Add quirk to disable MWS Transport Configuration
To: Sven Peter <sven@svenpeter.dev>
Cc: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Hector Martin <marcan@marcan.st>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sven,

On Thu, Oct 27, 2022 at 8:09 AM Sven Peter <sven@svenpeter.dev> wrote:
>
> Broadcom 4378/4387 controllers found in Apple Silicon Macs claim to
> support getting MWS Transport Layer Configuration,
>
> < HCI Command: Read Local Supported... (0x04|0x0002) plen 0
> > HCI Event: Command Complete (0x0e) plen 68
>       Read Local Supported Commands (0x04|0x0002) ncmd 1
>         Status: Success (0x00)
> [...]
>           Get MWS Transport Layer Configuration (Octet 30 - Bit 3)]
> [...]
>
> , but then don't actually allow the required command:
>
> > HCI Event: Command Complete (0x0e) plen 15
>       Get MWS Transport Layer Configuration (0x05|0x000c) ncmd 1
>         Status: Command Disallowed (0x0c)
>         Number of transports: 0
>         Baud rate list: 0 entries
>         00 00 00 00 00 00 00 00 00 00
>
> Signed-off-by: Sven Peter <sven@svenpeter.dev>
> ---
>  include/net/bluetooth/hci.h | 10 ++++++++++
>  net/bluetooth/hci_sync.c    |  2 ++
>  2 files changed, 12 insertions(+)
>
> diff --git a/include/net/bluetooth/hci.h b/include/net/bluetooth/hci.h
> index 8cd89948f961..110d6df1299b 100644
> --- a/include/net/bluetooth/hci.h
> +++ b/include/net/bluetooth/hci.h
> @@ -273,6 +273,16 @@ enum {
>          * during the hdev->setup vendor callback.
>          */
>         HCI_QUIRK_BROKEN_EXT_SCAN,
> +
> +       /*
> +        * When this quirk is set, the HCI_OP_GET_MWS_TRANSPORT_CONFIG command is
> +        * disabled. This is required for some Broadcom controllers which
> +        * erroneously claim to support MWS Transport Layer Configuration.
> +        *
> +        * This quirk can be set before hci_register_dev is called or
> +        * during the hdev->setup vendor callback.
> +        */
> +       HCI_QUIRK_BROKEN_MWS_TRANSPORT_CONFIG,
>  };
>
>  /* HCI device flags */
> diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
> index 76c3107c9f91..91788d356748 100644
> --- a/net/bluetooth/hci_sync.c
> +++ b/net/bluetooth/hci_sync.c
> @@ -4260,6 +4260,8 @@ static int hci_get_mws_transport_config_sync(struct hci_dev *hdev)
>  {
>         if (!(hdev->commands[30] & 0x08))
>                 return 0;
> +       if (test_bit(HCI_QUIRK_BROKEN_MWS_TRANSPORT_CONFIG, &hdev->quirks))
> +               return 0;

Let's add a macro that tests both the command and the quirk so we
don't have to test them separately.

>         return __hci_cmd_sync_status(hdev, HCI_OP_GET_MWS_TRANSPORT_CONFIG,
>                                      0, NULL, HCI_CMD_TIMEOUT);
> --
> 2.25.1
>


-- 
Luiz Augusto von Dentz
