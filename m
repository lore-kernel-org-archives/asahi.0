Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83DF3AC0E5
	for <asahi@lists.linux.dev>; Tue,  7 Apr 2026 13:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775569274; cv=pass; b=oSNNBFLw62J1/gvCyo1GU5gXkNTEOVQ4Ilg2Rxo0GrxWxZB9CU7VsXhZplsWmqsfFUH8CZNILlp4vx7EL6P1wOazfU9IMj670NnQPvxdQMIEs3xt7YKSp+gj+cNzTXGTEy6WO8/IIWqCyckqdDT1tpeEDUrqndtXyNFSAcL4BNs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775569274; c=relaxed/simple;
	bh=LRZ5hVwhom1Ev34WQmfOX4SnFiCZuFXFmOdeDfsbWdE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SaQcaduhtGJiw+PeaDxQQl+dEH0HMmnzYUlTH2qyUoIAKQZ6FoFeDtNzUDBYoqwj9cEvxifWWEYa3R3TE1z8HSJMTtnwYqMalAh9acug/r5lqA5QgS0E58b2MiwfviJzZqZGCXzU/BtmpUOIWbdZD2IMNCvVu1jX38aF/pvUbxk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CJsAdECv; arc=pass smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CJsAdECv"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-650221149e2so4985839d50.0
        for <asahi@lists.linux.dev>; Tue, 07 Apr 2026 06:41:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775569271; cv=none;
        d=google.com; s=arc-20240605;
        b=QqPYw0Iqj7WoKM8cMgIP3LaOvv/LVzi71o2/EaSUSHw23u6yX1nW5zIG9tb6U+mtSW
         suxIIecT+mCyMHP/P8584xqkqkUVFcbwcOjADlA5KsS8sIbT30hCY97bJNmXlrnpi0On
         RcYhHuZXVyejRqlGx8tcXktXtJ8dHClW0BaACv3e5s060roLcphVYi9MN8KcK7QZmieZ
         ShEmWLQB46z4FFIS4Ya254TwH3GXozSpJjrfGAbRFx0hDINmxr7Lqh+U/toG39CKNHOk
         JG4E/Wqp9xIkwtNe3S6s168vQQvSKB6WzvMtqEfE6QGe12D3dhYMiJXfvxEqL06syVXG
         3YQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K6+qhHS9U2NR5KN/+3DgIjEjwrsUhOTdOACQA1DQXNk=;
        fh=rtSZVkt/vfTS4anWaOVnCyV60oMHwkssZlUfsB/pfHo=;
        b=E6xjMpSFX1t8jbAfs0nBJP6kY3HMdb1UGxcHkBQVbe9q8hHnbdLvPkvp/Eoa5m4lul
         u1M+Lxv1taG3FEu2qawTKKEiggad59KI5IT7xNIBvmZM0kEaDL3RNPTYzPOGGVI8zJT8
         3Siy16q/PWouj8e/1WECHYnqfIMJtCQeNG1qjcLIVWXHU5qiEXfammDEfaUcvOPpSQNp
         ViuupsmVBJW/1JTDmCxorhlvLfcPc+JFbjJj+pD/ZS9c2Ed2gfLGKjomT9NAvfnxzvXX
         Em6SmXWfXwQmT04dOeTVR0OzCgrL8LWPZN2lpGXPsPOtA1cM7VZNyi7g/wkdhFvt/Bpp
         ax3A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775569271; x=1776174071; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K6+qhHS9U2NR5KN/+3DgIjEjwrsUhOTdOACQA1DQXNk=;
        b=CJsAdECvoed3KDvJ0stOBRhuackTOX1nTO7rVo6TTHLA6aajPUGGxHDUczjjZ1eiCV
         +Q1b8QMAnwqm7lo2YMcsXi2au7R4B30Aa16F4claA4TES5P9l8aXpsJ4uWCW85KHbGEQ
         Ys994B1zBcCnZM3aJlKBW9Yc1fU3bYYlcs84qvk7ZSqBzqihtYjgUyZSN9Q4eHPNSeQz
         1vYui8+ZGBFcO0uFwEFADUfK87enP+Pp0QfitviA5tymAz2DgBOsrZwYfQvS0jIaHTke
         cdDWm0JX8ilbYB8H3v7LXZGRZcwo9hWMnoVTZKkHkD/lJoq3KOp486KeBkdpa3GJOjIX
         kg8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775569271; x=1776174071;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K6+qhHS9U2NR5KN/+3DgIjEjwrsUhOTdOACQA1DQXNk=;
        b=gCAse1APQuiE8bUmbAwKoBmYmkJ3YFcKuvb5rQgwAAAYYYQUCRgR5J2JLeHxmMbCXW
         AOB+Gt4UokKNZaoipP/LCCT53wqq1iuanVt3IB0cHLHSyiPZO0PG1TdxFqEXFpbE/LUF
         s1rEUn+8w78CesZ0lwkE6sNBx/JH1jpIIaTXPjLTink6oFnAOcl16isxRTOnYUptvGNI
         lqjnesCNQiFQqUfV9oReUW9iygdL67JeP+OJeNx7K1c6AOYQiVADoZi7+E5MeOlGtPvx
         G5D9PmDAakvH/Uru4AQ/WkD2XRO7Smbpo7ADQ39soCENlWFj7fZN6WcxjeJeHIwh33bY
         ELJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtF+I4UWBGF/M8gHYOqO+zcqr37UBNNs11L4AjIC3cOiJpJS2IxyISHlmLbGXTUKgIkK2wwQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwEy9o0WZnZst5W+L5n/JxHi2Dr9rb4LNVVS712emYubHZidRys
	WlQPG6mHcqwwCNB2YBYBpPOcX+3Pgn+jTzm5sHNsUJku+e6aKc68TUyC3kDMtfQEeXAD5lUpuaF
	wvYiKm0fotd58sI2113l0ndGJ4lU2yH0=
X-Gm-Gg: AeBDiesdWNQC1PYkAcAdpp2IArPxQMOpdmqB2XPqsfdT1YBsvxA+4MFrkRuO6X9jSZt
	GZnQxX5nvpx9E/MEbpH/eqCkYRRoQQGSPczEYsnZpGZceHZodTmBU/CUbta2iuUcBOb9/xfRC0Y
	CVyxodcFE9sAO0pVvXk7IZSsMKuHap6ufXkQ5ZVPPc2JXB5Kbzcm0dhOo3xJYrTzbnyzuaVERiI
	tS8ls+mBnS9HWTQ1Zju0q+HDVhFmK5c/78Bp+0fcVKnhKGTmIP2vNPOvmh+37cLI/XfK+ojg3mG
	wVguoIzk+gZ6cC63ZKDCqKLmmLTlmLG64ByXKxcsV7DLMxkr/EeTs0oTw8t74Ov5s2VNbg==
X-Received: by 2002:a05:690e:4397:b0:64c:b81d:2cb7 with SMTP id
 956f58d0204a3-6504881bc03mr10964580d50.39.1775569270543; Tue, 07 Apr 2026
 06:41:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260407-brcm-prio-v1-1-f38b17376640@gmail.com>
In-Reply-To: <20260407-brcm-prio-v1-1-f38b17376640@gmail.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Tue, 7 Apr 2026 09:40:58 -0400
X-Gm-Features: AQROBzAa16hYCox9YuiofHUqjsYpvs_frFTh54dv3AlFBuE-XJcb0jeBhhoCcSI
Message-ID: <CABBYNZ+OrkJWcbVKkyrpX3HHJr7vGgC92Y=wkf6PPwR9Zr+mOQ@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: Add Broadcom channel priority commands
To: fnkl.kernel@gmail.com
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	Marcel Holtmann <marcel@holtmann.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Apr 7, 2026 at 8:09=E2=80=AFAM Sasha Finkelstein via B4 Relay
<devnull+fnkl.kernel.gmail.com@kernel.org> wrote:
>
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
>
> Certain Broadcom bluetooth chips (bcm4377/bcm4378/bcm438) need ACL
> streams carrying audio to be set as "high priority" using a vendor
> specific command to prevent 10-ish second-long dropouts whenever
> something does a device scan. This series adds an ioctl to control
> the priorities and hooks it up for the relevant chips.
>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  MAINTAINERS                      |  2 ++
>  drivers/bluetooth/hci_bcm4377.c  |  2 ++
>  include/net/bluetooth/hci_core.h | 12 ++++++++++++
>  include/net/bluetooth/hci_sock.h |  7 +++++++
>  net/bluetooth/Kconfig            |  7 +++++++
>  net/bluetooth/Makefile           |  1 +
>  net/bluetooth/brcm.c             | 29 +++++++++++++++++++++++++++++
>  net/bluetooth/brcm.h             | 17 +++++++++++++++++
>  net/bluetooth/hci_conn.c         | 11 +++++++++++
>  net/bluetooth/hci_sock.c         |  4 ++++
>  10 files changed, 92 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c3fe46d7c4bc..81be021367ec 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2562,6 +2562,8 @@ F:        include/dt-bindings/pinctrl/apple.h
>  F:     include/linux/mfd/macsmc.h
>  F:     include/linux/soc/apple/*
>  F:     include/uapi/drm/asahi_drm.h
> +F:     net/bluetooth/brcm.c
> +F:     net/bluetooth/brcm.h
>
>  ARM/ARTPEC MACHINE SUPPORT
>  M:     Jesper Nilsson <jesper.nilsson@axis.com>
> diff --git a/drivers/bluetooth/hci_bcm4377.c b/drivers/bluetooth/hci_bcm4=
377.c
> index 925d0a635945..5f79920c0306 100644
> --- a/drivers/bluetooth/hci_bcm4377.c
> +++ b/drivers/bluetooth/hci_bcm4377.c
> @@ -2397,6 +2397,8 @@ static int bcm4377_probe(struct pci_dev *pdev, cons=
t struct pci_device_id *id)
>         if (bcm4377->hw->broken_le_ext_adv_report_phy)
>                 hci_set_quirk(hdev, HCI_QUIRK_FIXUP_LE_EXT_ADV_REPORT_PHY=
);
>
> +       hci_set_brcm_capable(hdev);
> +
>         pci_set_drvdata(pdev, bcm4377);
>         hci_set_drvdata(hdev, bcm4377);
>         SET_HCIDEV_DEV(hdev, &pdev->dev);
> diff --git a/include/net/bluetooth/hci_core.h b/include/net/bluetooth/hci=
_core.h
> index a7bffb908c1e..ef3b5433203c 100644
> --- a/include/net/bluetooth/hci_core.h
> +++ b/include/net/bluetooth/hci_core.h
> @@ -642,6 +642,10 @@ struct hci_dev {
>         bool                    aosp_quality_report;
>  #endif
>
> +#if IS_ENABLED(CONFIG_BT_BRCMEXT)
> +       bool                    brcm_capable;
> +#endif
> +
>         int (*open)(struct hci_dev *hdev);
>         int (*close)(struct hci_dev *hdev);
>         int (*flush)(struct hci_dev *hdev);
> @@ -1791,6 +1795,13 @@ static inline void hci_set_aosp_capable(struct hci=
_dev *hdev)
>  #endif
>  }
>
> +static inline void hci_set_brcm_capable(struct hci_dev *hdev)
> +{
> +#if IS_ENABLED(CONFIG_BT_BRCMEXT)
> +       hdev->brcm_capable =3D true;
> +#endif
> +}
> +
>  static inline void hci_devcd_setup(struct hci_dev *hdev)
>  {
>  #ifdef CONFIG_DEV_COREDUMP
> @@ -1812,6 +1823,7 @@ int hci_get_conn_list(void __user *arg);
>  int hci_get_conn_info(struct hci_dev *hdev, void __user *arg);
>  int hci_get_auth_info(struct hci_dev *hdev, void __user *arg);
>  int hci_inquiry(void __user *arg);
> +int hci_set_acl_prio(struct hci_dev *hdev, void __user *arg);
>
>  struct bdaddr_list *hci_bdaddr_list_lookup(struct list_head *list,
>                                            bdaddr_t *bdaddr, u8 type);
> diff --git a/include/net/bluetooth/hci_sock.h b/include/net/bluetooth/hci=
_sock.h
> index 13e8cd4414a1..95d156ac4cae 100644
> --- a/include/net/bluetooth/hci_sock.h
> +++ b/include/net/bluetooth/hci_sock.h
> @@ -91,6 +91,8 @@ struct hci_ufilter {
>
>  #define HCIINQUIRY     _IOR('H', 240, int)
>
> +#define HCISETACLPRIO  _IOW('H', 250, int)

Nack, not going to introduce an ioctl command for this.

>  /* Ioctl requests structures */
>  struct hci_dev_stats {
>         __u32 err_rx;
> @@ -171,6 +173,11 @@ struct hci_inquiry_req {
>         __u8  length;
>         __u8  num_rsp;
>  };
> +
> +struct hci_acl_prio_req {
> +       __u16 handle;
> +       __u8  high_prio;
> +};
>  #define IREQ_CACHE_FLUSH 0x0001
>
>  #endif /* __HCI_SOCK_H */
> diff --git a/net/bluetooth/Kconfig b/net/bluetooth/Kconfig
> index 6b2b65a66700..0f2a5fbcafc5 100644
> --- a/net/bluetooth/Kconfig
> +++ b/net/bluetooth/Kconfig
> @@ -110,6 +110,13 @@ config BT_AOSPEXT
>           This options enables support for the Android Open Source
>           Project defined HCI vendor extensions.
>
> +config BT_BRCMEXT
> +       bool "Enable Broadcom extensions"
> +       depends on BT
> +       help
> +         This option enables support for the Broadcom defined HCI
> +         vendor extensions.
> +
>  config BT_DEBUGFS
>         bool "Export Bluetooth internals in debugfs"
>         depends on BT && DEBUG_FS
> diff --git a/net/bluetooth/Makefile b/net/bluetooth/Makefile
> index a7eede7616d8..b4c9013a46ce 100644
> --- a/net/bluetooth/Makefile
> +++ b/net/bluetooth/Makefile
> @@ -24,5 +24,6 @@ bluetooth-$(CONFIG_BT_LE) +=3D iso.o
>  bluetooth-$(CONFIG_BT_LEDS) +=3D leds.o
>  bluetooth-$(CONFIG_BT_MSFTEXT) +=3D msft.o
>  bluetooth-$(CONFIG_BT_AOSPEXT) +=3D aosp.o
> +bluetooth-$(CONFIG_BT_BRCMEXT) +=3D brcm.o
>  bluetooth-$(CONFIG_BT_DEBUGFS) +=3D hci_debugfs.o
>  bluetooth-$(CONFIG_BT_SELFTEST) +=3D selftest.o
> diff --git a/net/bluetooth/brcm.c b/net/bluetooth/brcm.c
> new file mode 100644
> index 000000000000..d03d2af5dc7e
> --- /dev/null
> +++ b/net/bluetooth/brcm.c
> @@ -0,0 +1,29 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2026 The Asahi Linux Contributors
> + */
> +
> +#include <net/bluetooth/bluetooth.h>
> +#include <net/bluetooth/hci_core.h>
> +
> +#include "brcm.h"
> +
> +int brcm_set_high_priority(struct hci_dev *hdev, u16 handle, bool enable=
)
> +{
> +       struct sk_buff *skb;
> +       u8 cmd[3];
> +
> +       if (!hdev->brcm_capable)
> +               return -EOPNOTSUPP;
> +
> +       cmd[0] =3D handle;
> +       cmd[1] =3D handle >> 8;
> +       cmd[2] =3D !!enable;
> +
> +       skb =3D hci_cmd_sync(hdev, 0xfc57, sizeof(cmd), cmd, HCI_CMD_TIME=
OUT);
> +       if (IS_ERR(skb))
> +               return PTR_ERR(skb);
> +
> +       kfree_skb(skb);
> +       return 0;
> +}
> diff --git a/net/bluetooth/brcm.h b/net/bluetooth/brcm.h
> new file mode 100644
> index 000000000000..a501f2988a96
> --- /dev/null
> +++ b/net/bluetooth/brcm.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2026 The Asahi Linux Contributors
> + */
> +
> +#if IS_ENABLED(CONFIG_BT_BRCMEXT)
> +
> +int brcm_set_high_priority(struct hci_dev *hdev, u16 handle, bool enable=
);
> +
> +#else
> +
> +static inline int brcm_set_high_priority(struct hci_dev *hdev, u16 handl=
e, bool enable)
> +{
> +       return -EOPNOTSUPP;
> +}
> +
> +#endif
> diff --git a/net/bluetooth/hci_conn.c b/net/bluetooth/hci_conn.c
> index 11d3ad8d2551..b2c7414a9c5b 100644
> --- a/net/bluetooth/hci_conn.c
> +++ b/net/bluetooth/hci_conn.c
> @@ -35,6 +35,7 @@
>  #include <net/bluetooth/iso.h>
>  #include <net/bluetooth/mgmt.h>
>
> +#include "brcm.h"
>  #include "smp.h"
>  #include "eir.h"
>
> @@ -2775,6 +2776,16 @@ int hci_get_auth_info(struct hci_dev *hdev, void _=
_user *arg)
>         return copy_to_user(arg, &req, sizeof(req)) ? -EFAULT : 0;
>  }
>
> +int hci_set_acl_prio(struct hci_dev *hdev, void __user *arg)
> +{
> +       struct hci_acl_prio_req req;
> +
> +       if (copy_from_user(&req, arg, sizeof(req)))
> +               return -EFAULT;
> +
> +       return brcm_set_high_priority(hdev, req.handle, req.high_prio);
> +}
> +
>  struct hci_chan *hci_chan_create(struct hci_conn *conn)
>  {
>         struct hci_dev *hdev =3D conn->hdev;
> diff --git a/net/bluetooth/hci_sock.c b/net/bluetooth/hci_sock.c
> index 0290dea081f6..4be6aeeb6bad 100644
> --- a/net/bluetooth/hci_sock.c
> +++ b/net/bluetooth/hci_sock.c
> @@ -1035,6 +1035,9 @@ static int hci_sock_bound_ioctl(struct sock *sk, un=
signed int cmd,
>                 if (!capable(CAP_NET_ADMIN))
>                         return -EPERM;
>                 return hci_sock_reject_list_del(hdev, (void __user *)arg)=
;
> +
> +       case HCISETACLPRIO:
> +               return hci_set_acl_prio(hdev, (void __user *)arg);
>         }
>
>         return -ENOIOCTLCMD;
> @@ -1072,6 +1075,7 @@ static int hci_sock_ioctl(struct socket *sock, unsi=
gned int cmd,
>         case HCIGETAUTHINFO:
>         case HCIBLOCKADDR:
>         case HCIUNBLOCKADDR:
> +       case HCISETACLPRIO:
>                 break;
>         default:
>                 return -ENOIOCTLCMD;
>
> ---
> base-commit: bfe62a454542cfad3379f6ef5680b125f41e20f4
> change-id: 20260407-brcm-prio-b630e6cc3834
>
> Best regards,
> --
> Sasha Finkelstein <fnkl.kernel@gmail.com>

The simple solution would be for the driver to set all ACL connections
with high priority since in most cases we do want connections having
higher priority than scanning. That said, we may need to identify
which connections are performing audio versus those that are not. For
the audio connections, perhaps we could use skb->priority to set their
priority (provided userspace sets it for audio).

--=20
Luiz Augusto von Dentz
