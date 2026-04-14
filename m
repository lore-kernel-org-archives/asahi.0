Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070901E9B3D
	for <asahi@lists.linux.dev>; Tue, 14 Apr 2026 14:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776175218; cv=pass; b=mGR4/SGv688g2Mp+OL6XvACt3ZdJ+qe+WXJ837p48eM09rmn5wLzHW3gBwBDiAu77qbZmZtFJ6WXyR/JJc9BrFFopdsu8kdiwwgk1Yplayx6Bg7vKC+ZS6AhMeir8eQ9pbXiJXxNUMd8Ap7BaTHD7QXj8HHxxyIb5X9536YN2Is=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776175218; c=relaxed/simple;
	bh=tRdcvGDu2KlZy2Aw8Uf9ZHNnXnblpja1kseer4xSQZw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nII1VdIN/kmltrsEfcLWjetisiRztQ2dCeC7iZlAAFRUprnF0CFGeDmJKV9kmJ56OQPdKCSEZEEbQ3tE4kafZTqd0MP7vCu704ifyNs6jo3CuEz724nh0ctfuPzphxaUsOS4sZ9E1t+E6uOxf5DmBOLDao5nEKuquuRPE7xNovQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LTQzs4d0; arc=pass smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LTQzs4d0"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-679f6ee3fb0so1948046eaf.2
        for <asahi@lists.linux.dev>; Tue, 14 Apr 2026 07:00:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776175216; cv=none;
        d=google.com; s=arc-20240605;
        b=hb+cazg6sL4dJEPSaqnhCqaylaTo7FQ1xOx/1ApRxlvgKGQHtX0tyd0tussb4BjDUf
         WhN5heHV7KXQCJhoFn1ZNs6wUWnKhlgndJdEGF/tBtEmr7QE5YhWBZZiZ60QDqox+YrK
         tekmu4rUzvc2jH0E/3L4SulQAHrCpadBU8rKXBFSMB/D2J3pUjfWbheGfFz5jhW4Fcxs
         F3eSoCVpug+iQbR3mf7qn5zeaTAaIh9LAMgfzW+PvtNB+vsgZtiSRn1TW3cjfj2MYSlk
         V8XdogZIdQM93LkwiJ5ed46VjXPr7bnoQFVjOX6cF52eFKuH604iASIRREOPoq3UpQSO
         xtkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=49AG2x6pEGoNnPJicOOKoScg9J+gRSWBSIBGOGB3T+I=;
        fh=NIxhKI4/HxhMqJ7atMiAY0HgbXg7G0yfeyNs8ajiYF0=;
        b=RKLRi4bpWvscx3Z9z3caLFwmnOj2y48HzFKq4hW3Llp06Q+Q2efyu+4U5OmhaJu4yq
         AzFKj0DV4Nru6U6vyPhSchQa2QOyEuteOkj5uTNMbfJak5Bt6S+8VQJF7y7Q5pkTd+WN
         tNcEi6tH3ewkkPWQPiIKRqIQkQ4yWPuqTeYWjhcL601bdiGJFklQymggr+LTleBHca4C
         wVQHnlUbOA3NjQgbUVnVRmrSquI34q2l5IF690+bVbIVEOl7a9zt5Q+250Z/I+34uBc2
         oKek+dsgcyjYwPF6N2rEhEcg1/4iJ5UqRoZBgn6obBRHjjSnLtHRk7NlfRPeOKUwX5QP
         5UqQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776175216; x=1776780016; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=49AG2x6pEGoNnPJicOOKoScg9J+gRSWBSIBGOGB3T+I=;
        b=LTQzs4d0fNAW93MKDb307jAHXJk7XMkisIP8IGw1A9TgEMrUGNloAlljJeI5qhtxf8
         DMOdXIMps4fIICQ8ukwGnT5HcywdO00YT1nqrJkxmwOspyuByIvu7OPp0hZ1qcgslnUs
         0ZJv7zB36vJMKXOzj6Jdt8wx/JhMfWiPYatqvlmGJG3Pv6Wu7yYT8j9pXMIS9L10z+HZ
         GHgdoKupD4f2zlsNVHpyqLvtZuhbMLbTZGZZh6GKRJ5+/F+phBiLzIt15i/vq7HcPEyB
         yvQdmqyWDxqLIE3AZA0gQWOC1eEVoAOigntJNDOqrqnMj4lp/t28imoBMRFqOh2ZKzQm
         TWfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776175216; x=1776780016;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=49AG2x6pEGoNnPJicOOKoScg9J+gRSWBSIBGOGB3T+I=;
        b=heMnJSdPyKzR08llU5tiKf+6NqUPvC2oVLw+hGcCn5QHe1bw8YrtZi+0uKWjHFYI2L
         +siWQ3JNg9JbqbGyywiny7+U0jCalrmOHEShV0vGWuytkSteACVplr+xIrq95UbQ6T1+
         vlISh0g2t86wJoQIHKnS5vrapubN12MH5JmXaUpv7RLdcw86ri9vsemTN9LFZJnIJN7j
         hUXdaychK5qf8WqQ5xro6tJ44IUPEZIL2dU5htc5+CcsBvoa+xMBmSZCrb/ASLR87qyV
         WU4r3snYD/mog4/Qo6YzHWAEZFeQ/DzvgcF6ABsenBoa+cIUH0K4GdFnz3WcQhNPVKeZ
         o5dg==
X-Forwarded-Encrypted: i=1; AFNElJ85tJyF//lOIWGAI4FECgdJqdOGtvj5QyOW0JT7WSd501dYiwJJJC28MLggbXjqlp4sxv4rYA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzn6n3JJpuJn/8VMEi2dnokHoJOx5fibWW7aUPW2vw6Lo50X+5A
	fmsC2DhzZ9DyuJADA3SsFnPkh3EUqANTy85czqezzYaT8UKvv+IuOLDX28ogBviqoQ4M9Hytjbv
	RS56m9nexKn6QVg/+1fczSgu61o2B3v8=
X-Gm-Gg: AeBDiesiZfQAoeRmyTsA2YNukdPYR4tHZaMyop8Ms6SxudstF4kb0KD+yULAdgrI9Kf
	M1LDrzEekrf1x+Akmb4BX54qN4gsl+1mxyORqLD9cwFpYfRbX0AsUIl08jQB9szg+1xVSsvkxSr
	DmfRIXVzAYZmP082h8ZIgvhtU5J24KKYFgsuF/zecuzy5ktO+jy6CYJ3dGNZDGLO/JqdDqzDPwF
	dL5KRXJuRYQB8QfoWRT8gegB4jjEmdqeUa3++wHIGQ30CMspfP/iIS11IEIjPXE09yNLfaspqK+
	P11b1+B47zowT5V82NDg4dyPM1owGj0On6480z5yd/iFWNwOp0j1oOUiavDJB/jqzGeahUw7Bot
	2xnIW
X-Received: by 2002:a4a:ee08:0:b0:692:9c90:8e9a with SMTP id
 006d021491bc7-6929c9093admr97107eaf.45.1776175215502; Tue, 14 Apr 2026
 07:00:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260407-brcm-prio-v2-1-3f745edf49af@gmail.com>
In-Reply-To: <20260407-brcm-prio-v2-1-3f745edf49af@gmail.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Tue, 14 Apr 2026 10:00:02 -0400
X-Gm-Features: AQROBzDtNMc0E_keXTqptniCR183NjGNZBRqq-7Qjon6jglhw36fYEjsseB1EhQ
Message-ID: <CABBYNZJAEqwfTuVqbFAnx97HBSjcwn3Hb+y+r4r2C=MMPxFoDg@mail.gmail.com>
Subject: Re: [PATCH v2] Bluetooth: Add Broadcom channel priority commands
To: fnkl.kernel@gmail.com
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	Marcel Holtmann <marcel@holtmann.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sasha,

On Tue, Apr 7, 2026 at 1:46=E2=80=AFPM Sasha Finkelstein via B4 Relay
<devnull+fnkl.kernel.gmail.com@kernel.org> wrote:
>
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
>
> Certain Broadcom bluetooth chips (bcm4377/bcm4378/bcm438) need ACL
> streams carrying audio to be set as "high priority" using a vendor
> specific command to prevent 10-ish second-long dropouts whenever
> something does a device scan. This patch sends the command when the
> socket priority is set to TC_PRIO_INTERACTIVE, as BlueZ does for audio.
>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
> Changes in v2:
> - new ioctl got nack-ed, so let's use sk_priority as the trigger
> - Link to v1: https://lore.kernel.org/r/20260407-brcm-prio-v1-1-f38b17376=
640@gmail.com
> ---
>  MAINTAINERS                       |  2 ++
>  drivers/bluetooth/hci_bcm4377.c   |  2 ++
>  include/net/bluetooth/bluetooth.h |  4 ++++
>  include/net/bluetooth/hci_core.h  | 11 +++++++++++
>  net/bluetooth/Kconfig             |  7 +++++++
>  net/bluetooth/Makefile            |  1 +
>  net/bluetooth/brcm.c              | 29 +++++++++++++++++++++++++++++
>  net/bluetooth/brcm.h              | 17 +++++++++++++++++
>  net/bluetooth/hci_conn.c          | 28 ++++++++++++++++++++++++++++
>  net/bluetooth/l2cap_sock.c        | 13 +++++++++++++
>  10 files changed, 114 insertions(+)
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
> diff --git a/include/net/bluetooth/bluetooth.h b/include/net/bluetooth/bl=
uetooth.h
> index 69eed69f7f26..07a250673950 100644
> --- a/include/net/bluetooth/bluetooth.h
> +++ b/include/net/bluetooth/bluetooth.h
> @@ -457,6 +457,7 @@ struct l2cap_ctrl {
>  };
>
>  struct hci_dev;
> +struct hci_conn;
>
>  typedef void (*hci_req_complete_t)(struct hci_dev *hdev, u8 status, u16 =
opcode);
>  typedef void (*hci_req_complete_skb_t)(struct hci_dev *hdev, u8 status,
> @@ -469,6 +470,9 @@ void hci_req_cmd_complete(struct hci_dev *hdev, u16 o=
pcode, u8 status,
>  int hci_ethtool_ts_info(unsigned int index, int sk_proto,
>                         struct kernel_ethtool_ts_info *ts_info);
>
> +int hci_conn_setsockopt(struct hci_conn *conn, struct sock *sk, int leve=
l,
> +                       int optname, sockptr_t optval, unsigned int optle=
n);
> +
>  #define HCI_REQ_START  BIT(0)
>  #define HCI_REQ_SKB    BIT(1)
>
> diff --git a/include/net/bluetooth/hci_core.h b/include/net/bluetooth/hci=
_core.h
> index a7bffb908c1e..947e7c2b08dd 100644
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
> index 000000000000..9aa0a265ab3d
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
> +               return 0;
> +
> +       cmd[0] =3D handle;
> +       cmd[1] =3D handle >> 8;

Adding a packed struct and then using something like cpu_to_le16 is
probably preferable over above.

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
> index 000000000000..fdaee63bd1d2
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
> +       return 0;
> +}
> +
> +#endif
> diff --git a/net/bluetooth/hci_conn.c b/net/bluetooth/hci_conn.c
> index 11d3ad8d2551..096163840f62 100644
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
> @@ -3070,6 +3071,33 @@ int hci_conn_set_phy(struct hci_conn *conn, u32 ph=
ys)
>         }
>  }
>
> +int hci_conn_setsockopt(struct hci_conn *conn, struct sock *sk, int leve=
l,
> +                       int optname, sockptr_t optval, unsigned int optle=
n)
> +{
> +       int val;
> +       bool old_high, new_high, changed;
> +
> +       if (level !=3D SOL_SOCKET)
> +               return 0;
> +
> +       if (optname !=3D SO_PRIORITY)
> +               return 0;
> +
> +       if (optlen < sizeof(int))
> +               return -EINVAL;
> +
> +       if (copy_from_sockptr(&val, optval, sizeof(val)))
> +               return -EFAULT;
> +
> +       old_high =3D sk->sk_priority >=3D TC_PRIO_INTERACTIVE;
> +       new_high =3D val >=3D TC_PRIO_INTERACTIVE;
> +       changed =3D old_high !=3D new_high;
> +       if (!changed)
> +               return 0;
> +
> +       return brcm_set_high_priority(conn->hdev, conn->handle, new_high)=
;

The skb carries the priority (skb->priority), not sure why you need to
capture the sk_priority instead, doing so ignores the load balance
that hci_core performs to avoid starving connections.

> +}
> +
>  static int abort_conn_sync(struct hci_dev *hdev, void *data)
>  {
>         struct hci_conn *conn =3D data;
> diff --git a/net/bluetooth/l2cap_sock.c b/net/bluetooth/l2cap_sock.c
> index 71e8c1b45bce..d5eef87accc4 100644
> --- a/net/bluetooth/l2cap_sock.c
> +++ b/net/bluetooth/l2cap_sock.c
> @@ -891,6 +891,16 @@ static int l2cap_sock_setsockopt(struct socket *sock=
, int level, int optname,
>
>         BT_DBG("sk %p", sk);
>
> +       if (level =3D=3D SOL_SOCKET) {
> +               conn =3D chan->conn;
> +               if (conn)
> +                       err =3D hci_conn_setsockopt(conn->hcon, sock->sk,=
 level,
> +                                                 optname, optval, optlen=
);
> +               if (err)
> +                       return err;
> +               return sock_setsockopt(sock, level, optname, optval, optl=
en);
> +       }
> +
>         if (level =3D=3D SOL_L2CAP)
>                 return l2cap_sock_setsockopt_old(sock, optname, optval, o=
ptlen);
>
> @@ -1931,6 +1941,9 @@ static struct sock *l2cap_sock_alloc(struct net *ne=
t, struct socket *sock,
>
>         INIT_LIST_HEAD(&l2cap_pi(sk)->rx_busy);
>
> +       if (sock)
> +               set_bit(SOCK_CUSTOM_SOCKOPT, &sock->flags);

This is more complicated than it needs to be. I'd just add a new
callback, `hdev->set_priority(handle, skb->priority)`, so the driver
is called whenever it needs to elevate a connection's priority, that
said there could be cases where a connection needs its priority set
momentarily to transmit A2DP, followed by OBEX packets that are best
effort. Therefore, `hci_conn` will probably need to track the priority
so it can detect when it needs changing on a per skb basis.

>         chan =3D l2cap_chan_create();
>         if (!chan) {
>                 sk_free(sk);
>
> ---
> base-commit: bfe62a454542cfad3379f6ef5680b125f41e20f4
> change-id: 20260407-brcm-prio-b630e6cc3834
>
> Best regards,
> --
> Sasha Finkelstein <fnkl.kernel@gmail.com>
>
>


--=20
Luiz Augusto von Dentz
