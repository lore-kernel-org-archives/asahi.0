Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0115F156E6
	for <asahi@lists.linux.dev>; Tue,  2 Jan 2024 18:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZlQZNg/a"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2cd0f4797aaso8935761fa.0
        for <asahi@lists.linux.dev>; Tue, 02 Jan 2024 10:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704220328; x=1704825128; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=meV8SzFKE9ByJNsnfBulTLpQ7dcVBr4I/UuViUtYF6s=;
        b=ZlQZNg/asx2qfmrXWuqV8GQL5BNrcESuyQg9ocLjn5Z2NOF4Wdge/6FZr4+Uz3KLRe
         Fj4tEXE5qWFG+LVCTzezKKzkMTTcSOyKY4Wvr7rK66a7mNVv3/QMFTJE2tqH8CoJzn5W
         cFSzRREo95289Pi7rkuzTvOKYIU6YOESzVLvTFIBxGN7kXy8B1XXPAD6IdaaearC2LZb
         NhS5i/OJYvXQLSOPro7fxa4ZWNwHOGX4n/EvGoIpSQqGfhs5LQsFDbBw+jjpcMtgc0z8
         qiV27Fi62AxABI6cO/5faBeD2E6HEBD9QUIp5fBor6AYDoSwecDdKYzSVtK1eTcCHX8c
         W1bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704220328; x=1704825128;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=meV8SzFKE9ByJNsnfBulTLpQ7dcVBr4I/UuViUtYF6s=;
        b=LLUbiVAPemgsuEKahdHgoiDifT4+hgY19w0/UOgKRwjlqhKc/PeQ3uqIlAN7odSf2B
         jBBO8hNrl81P3wsxgUS8lEWU9FZKvJ/KMu9fGCmefI6pVWKnzAa6VVZaAIW2LzmS6Qio
         myMBlARDkwNUPGZEZBniH2Og5+JvJCGovR8uFa9wrjHW/DESHfSC2ZbCeUToGQY99ano
         zuwZK7l3+jgY6OXKeUbIl/+1m7nB69ZymSPh5DTjNf1G8GB91EgaWkyQl8VqzVJXKL8q
         aDhyGBzZBvLv7ZQQ60iINhNIyfJZ3Z+IVxBg8jqQLKZWtxg2QwUm6UVWKlfKfvNBsLcy
         cq7g==
X-Gm-Message-State: AOJu0YxyCWwR1/f3kEjW+Oo1rx16IHclTXjPx4M0Yyt8hGAom0d0VMJc
	WvSFYRMSBGHOLhfKXu8pkS0eu4VypowPPYWHT7E=
X-Google-Smtp-Source: AGHT+IH0qHC6wDOX3mtYQS9oQ3DnnXzvTNQhF+EeEK75UmAg65xMQhJEfRmiKwCMFnLOnG9ZyOOjvlZZ6ldGpcw3Z5o=
X-Received: by 2002:a05:651c:210a:b0:2cc:bfdb:f089 with SMTP id
 a10-20020a05651c210a00b002ccbfdbf089mr7052613ljq.61.1704220327737; Tue, 02
 Jan 2024 10:32:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240102181946.57288-1-verdre@v0yd.nl> <20240102181946.57288-5-verdre@v0yd.nl>
In-Reply-To: <20240102181946.57288-5-verdre@v0yd.nl>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Tue, 2 Jan 2024 13:31:55 -0500
Message-ID: <CABBYNZ+uy50g2CSJ37DL63ycSJc96Xegdjcr6N2weJfCiGO_Aw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] Bluetooth: Queue a HCI power-off command before
 rfkilling adapters
To: =?UTF-8?Q?Jonas_Dre=C3=9Fler?= <verdre@v0yd.nl>
Cc: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, asahi@lists.linux.dev, 
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jonas,

On Tue, Jan 2, 2024 at 1:19=E2=80=AFPM Jonas Dre=C3=9Fler <verdre@v0yd.nl> =
wrote:
>
> On a lot of platforms (at least the MS Surface devices, M1 macbooks, and
> a few ThinkPads) firmware doesn't do its job when rfkilling a device
> and the bluetooth adapter is not actually shut down on rfkill. This leads
> to connected devices remaining in connected state and the bluetooth
> connection eventually timing out after rfkilling an adapter.
>
> Use the rfkill hook in the HCI driver to actually power the device off
> before rfkilling it.
>
> Note that the wifi subsystem is doing something similar by calling
> cfg80211_shutdown_all_interfaces()
> in it's rfkill set_block callback (see cfg80211_rfkill_set_block).

So the rfkill is supposed to be wait for cleanup, not a forceful
shutdown of RF traffic? I assume it would be the later since to do a
proper cleanup that could cause more RF traffic while the current
assumption was to stop all traffic and then call hdev->shutdown to
ensure the driver does shutdown the RF traffic, perhaps this
assumption has changed over time since interrupting the RF traffic may
cause what you just described because the remote end will have to rely
on link-loss logic to detect the connection has been terminated.

> Signed-off-by: Jonas Dre=C3=9Fler <verdre@v0yd.nl>
> ---
>  net/bluetooth/hci_core.c | 33 ++++++++++++++++++++++++++++++---
>  1 file changed, 30 insertions(+), 3 deletions(-)
>
> diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
> index 1ec83985f..1c91d02f7 100644
> --- a/net/bluetooth/hci_core.c
> +++ b/net/bluetooth/hci_core.c
> @@ -543,6 +543,23 @@ int hci_dev_open(__u16 dev)
>         return err;
>  }
>
> +static int set_powered_off_sync(struct hci_dev *hdev, void *data)
> +{
> +       return hci_set_powered_sync(hdev, false);
> +}
> +
> +static void set_powered_off_sync_complete(struct hci_dev *hdev, void *da=
ta, int err)
> +{
> +       if (err)
> +               bt_dev_err(hdev, "Powering HCI device off before rfkillin=
g failed (%d)", err);
> +}
> +
> +static int hci_dev_do_poweroff(struct hci_dev *hdev)
> +{
> +       return hci_cmd_sync_queue(hdev, set_powered_off_sync,
> +                                 NULL, set_powered_off_sync_complete);
> +}
> +
>  int hci_dev_do_close(struct hci_dev *hdev)
>  {
>         int err;
> @@ -943,17 +960,27 @@ int hci_get_dev_info(void __user *arg)
>  static int hci_rfkill_set_block(void *data, bool blocked)
>  {
>         struct hci_dev *hdev =3D data;
> +       int err;
>
>         BT_DBG("%p name %s blocked %d", hdev, hdev->name, blocked);
>
>         if (hci_dev_test_flag(hdev, HCI_USER_CHANNEL))
>                 return -EBUSY;
>
> +       if (blocked =3D=3D hci_dev_test_flag(hdev, HCI_RFKILLED))
> +               return 0;
> +
>         if (blocked) {
> -               hci_dev_set_flag(hdev, HCI_RFKILLED);
>                 if (!hci_dev_test_flag(hdev, HCI_SETUP) &&
> -                   !hci_dev_test_flag(hdev, HCI_CONFIG))
> -                       hci_dev_do_close(hdev);
> +                   !hci_dev_test_flag(hdev, HCI_CONFIG)) {
> +                       err =3D hci_dev_do_poweroff(hdev);
> +                       if (err) {
> +                               bt_dev_err(hdev, "Powering off device bef=
ore rfkilling failed (%d)",
> +                                          err);
> +                       }

You already have the error printed on set_powered_off_sync_complete
not sure why you have it here as well.

> +               }
> +
> +               hci_dev_set_flag(hdev, HCI_RFKILLED);

Before we used to set the HCI_RFKILLED beforehand, is this change
really intended or not? I think we should keep doing it ahead of power
off sequence since we can probably use it to ignore if there are any
errors on the cleanup, etc.

>         } else {
>                 hci_dev_clear_flag(hdev, HCI_RFKILLED);
>         }
> --
> 2.43.0
>


--=20
Luiz Augusto von Dentz
