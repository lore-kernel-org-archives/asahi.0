Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793580527;
	b=kTO7aIINT3l9OKSbQHNfdAQ/dSpLfRXAxwg+W2oyDvoP7fOBSugj985G+isxwyFY3gDI
	 0vCJAwfgaEuen79402ivaHrKWXxdgCr1oDd+0lLq9mdABF1pneMUKeIMocKwfaVEfGt19
	 kB0Digi5fN4HhQJ2lj0lwdsjJntfEJrunwEv8tlZFSvYnCuFzByKofk96dZTVvanYWOd5
	 AXyzHf7VmP8LWDrws50gBD4+C2pbLiHEmTT/m/bMJhoJDzLhOWvGAOgJn+jMyyJnZjRl9
	 p3Inp66Td/EXz/WkyO9okh3dTJelsbeUoPnlSgVFJ1Q80Qm8iORpIDIBgnarvcF/JLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793580527;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=AxLijxCHhlhY2faPDuw/HBU0+yy89FEV9COVq1aaz44=;
	b=nzYqI4mgfpGRvhjO8V2EpBit9e/AMmeVjMZs5ABAXYwYfivEifbiOqhJqgza5jzOzvSp
	 Xfe+HX+nu6Nu7XBEgeqv6BD10LnMwJgfLM+ZMeTLbL1PIE82XpII5jK8WeZ5ZhvlUCEJE
	 CQaoF1KxEAEq1tUnGZsgRuxNlLkfY5kbFqGZRSxaXDJ5vZWD4/93/lnPNF8TwGXz0dd7i
	 /wMRWO6gz+SZiozjiqqG7eZhuCpOidtIlQV6BD6PelEWtYMejlIQRj5/GcrCouH53Lzfu
	 lrZkbX5dcVWCGgneq7y6nm4L5hHOKAlAc5tyJ8H01/EE/CWvQTUBXU+u6CMRPpHgv9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gompa.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09F3606A324
	for <asahi@lists.linux.dev>; Mon,  2 Nov 2026 00:48:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C09F3606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-533778ab0bdso37123181cf.3
        for <asahi@lists.linux.dev>; Sun, 01 Nov 2026 16:48:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793580526; x=1794185326;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AxLijxCHhlhY2faPDuw/HBU0+yy89FEV9COVq1aaz44=;
        b=0Yd1WeRdg6k3tP98tq49Qq1HRsz+/Xi+7GCLV/AZyeRJ9cRS7w67qcIk0G6hIOqYfG
         44+js9DFIOxImhrH0y6w4XsJadLkYLuUfG5xugoUmgcau30Ll7HGf2NcM3jo7efycGKo
         IvRVm1ORAeLhqEtOQblRdiYJYJ5es+Z5xRhJ/vtDIylz7pyT6JpUecXPG5Ue18GLWej8
         uhZWile5TnGxY/Ui/ixVbSDD/l5zdbhoF7ZWM++nIypxHXFSeEq/6yr3BqPODvOvAeF+
         rI2PMs8X78prewr+TpOeUzwU2AtGmdj51hi8MVlqpN7fc0Xo2x1wKjgd9/LgI47IMstm
         ZrFA==
X-Forwarded-Encrypted: i=1; AKwUvBx9R4RPQwXaxlLuybFl5xhixTgZRbuNxGJNBQfVhwmrilwmn+nc8HsjeCKpLipx/wqYZ7aRDA==@lists.linux.dev
X-Gm-Message-State: AFq9FYKyJ4oJUCUzziYjSkXvlM4HOK05moCT3uersZ3xb9dGWaXbe4QW
	8PdCtvF+AI1fn7+3stTjd7Y3vk+OKQvJ33xjnsF7TQUY7tHeSZyESYigQStNyNfx
X-Gm-Gg: AYBFou1a9vZSECJWRvMxbhuNK1skR61w5UxmVaTuB7yDwiTjyrgkv3cdBGMKAt+CTAv
	JDyWEnCELO5sZ2jIWwvT10sA9AZWGKBaFfSiuaHraXfMGtsySHDAmEu2BEGDvnMVth08raUAiGv
	Vt4tp04UQBfe+dPBWRYMlSYF/mRGyb8VxfiAP6hc3pKyGlGZlFQPCtmzVbplxxY6IvjriwEuWEE
	7JxLmwOJ5AXdbU+FB+3ZnacW2wRYlZYqNnA+orlIhypelgKpl+3SpIt+S5+aXN1IBl/k6fHWnL7
	tia0Q3L1C6xkUdrYmlpWEIFBWbp63uAJcEZNHpxRBd1eyniXoeGuLoOkRy4y8J6J4No/Jyu5Fpr
	2xZad/25zXwbv5KaV32gCDy7x48BxuJ7T5Ws1LMJ8y7/YPCax7kHDYMDYjl/GozC7nWxrFSegmn
	24Es3JNmmG9dOuGYniOGFXk70CNGvAJ9c4hsBVgRwgabgcHXaUBYth/p9ncGeS4/1g6xa9FMcCk
	pDlDtGdzK1e2T+42pmOLGCAmKXfcALjLfallWdHCUFJHwd/5nMk5GC0htBxfqBIf5pxw3wxMAix
	Q7RfBReM0Jkg2E7GXfpKXveYQUs3aaMsGTt+wJVZSs08hBC04jaRxB9rME9QsdslI1FoduBFWSf
	aeaBblL1pClyBnSCuHCVjUEZBlh8KWWq/Wn4oqnoAhEb1WBJpRVbULwKMZPKiCwLjs4SiyLbstN
	p3TnHwL+DXg6ADufX1SymbuK6F
X-Received: by 2002:ac8:5dd3:0:b0:536:54a4:da1b with SMTP id d75a77b69052e-542b639bb34mr148925661cf.19.1793580525615;
        Sun, 01 Nov 2026 16:48:45 -0800 (PST)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com. [209.85.222.181])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5479b62dc2esm17366581cf.27.2026.11.01.16.48.45
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 16:48:45 -0800 (PST)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-93f269e335eso339987385a.3
        for <asahi@lists.linux.dev>; Sun, 01 Nov 2026 16:48:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwW5RpAeMnk+5SRQDP3cRaXqknLZByktT4xbRlVtewGIZl4URNkUrU99EbAJPxQDUhBbvlkBw==@lists.linux.dev
X-Received: by 2002:a05:6830:3e03:b0:814:b62d:3122 with SMTP id
 46e09a7af769-85d365b1f81mr6135908a34.22.1793580185285; Sun, 01 Nov 2026
 16:43:05 -0800 (PST)
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20260925-brcm4388-submit-v1-0-b5cbc2cde2fb@gmail.com>
In-Reply-To: <20260925-brcm4388-submit-v1-0-b5cbc2cde2fb@gmail.com>
From: Neal Gompa <neal@gompa.dev>
Date: Sun, 1 Nov 2026 19:42:28 -0500
X-Gmail-Original-Message-ID: <CAEg-Je918POdPr-=6Dzpdkx_i+Hv4wxv5-8A3MUDEqC8SA59NA@mail.gmail.com>
X-Gm-Features: AclHuK_r7QD-EGzh5icdkxVPJ8YDU4Pcq4HDNCl7O8hh8I3jnfCORQFhQybBRTw
Message-ID: <CAEg-Je918POdPr-=6Dzpdkx_i+Hv4wxv5-8A3MUDEqC8SA59NA@mail.gmail.com>
Subject: Re: [PATCH 00/13] wifi: brcmfmac: Add BCM4388 support
To: michael.reeves077@gmail.com
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>, 
	Pieter-Paul Giesberts <pieterpg@broadcom.com>, "Franky Lin (Zhenhui)" <frankyl@broadcom.com>, 
	Mathy Vanhoef <vanhoefm@gmail.com>, Kalle Valo <kvalo@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-wireless@vger.kernel.org, 
	brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com, 
	asahi@lists.linux.dev, Hector Martin <marcan@marcan.st>, 
	Daniel Berlin <dberlin@dberlin.org>, Janne Grunau <j@jannau.net>, linux-kernel@vger.kernel.org, 
	Hante Meuleman <meuleman@broadcom.com>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 9:49=E2=80=AFAM Michael Reeves via B4 Relay
<devnull+michael.reeves077.gmail.com@kernel.org> wrote:
>
> The Broadcom BCM4388 chipset requires new PCIe initialization and
> firmware interfaces. Add support for these interfaces to brcmfmac to
> enable basic station operation.
>
> This series adds:
> - Signed firmware loading and mailbox transport
> - Fixes for chip identification and firmware capability matching
> - Versioned scan and join requests, and extended PMK payloads
> - Updated event mask handling
>
> These changes include work by Hector Martin and Daniel Berlin from Asahi
> Linux, refactored where needed for upstream inclusion.
>
> The series provides basic station support only. 6 GHz support is planned
> for a follow-up patchset after this lands. The driver retains legacy
> interfaces for older firmware.
>
> Tested on an Apple M3 MacBook Air (J613):
> - Device boot and network scanning
> - 5 GHz WPA2-PSK association and DHCP
> - Bidirectional TCP traffic
>
> Testing required separate Apple PCIe and devicetree patches, as well as
> Janne Grunau's port-authorization fix [1].
>
> [1] https://lore.kernel.org/linux-wireless/20260915-brcmfmac-4way-handsha=
ke-offload-authenticated-event-v2-1-fbb9cc7ac177@jannau.net/
>
> ---
> Daniel Berlin (1):
>       wifi: brcmfmac: Support versioned scan parameter layouts
>
> Hector Martin (6):
>       wifi: brcmfmac: Support newer PCIe core startup and interrupts
>       wifi: brcmfmac: Negotiate PCIe mailbox transport with firmware
>       wifi: brcmfmac: Load signed PCIe firmware images
>       wifi: brcmfmac: Accept newer BSS information versions
>       wifi: brcmfmac: Support versioned join requests
>       wifi: brcmfmac: Add BCM4388 support
>
> Michael Reeves (6):
>       wifi: brcmfmac: pcie: Report the detected chip ID to the bus
>       wifi: brcmfmac: Match complete firmware capability names
>       wifi: brcmfmac: Fall back to RSSI-only default join preferences
>       wifi: brcmfmac: Use event_msgs_ext for event masks
>       wifi: brcmfmac: Handle larger firmware band lists
>       wifi: brcmfmac: Handle extended PMK command payloads
>
>  .../wireless/broadcom/brcm80211/brcmfmac/Makefile  |   1 +
>  .../net/wireless/broadcom/brcm80211/brcmfmac/bus.h |   9 +
>  .../broadcom/brcm80211/brcmfmac/cfg80211.c         | 368 +++++++-------
>  .../wireless/broadcom/brcm80211/brcmfmac/chip.c    |  36 +-
>  .../wireless/broadcom/brcm80211/brcmfmac/common.c  |  27 +-
>  .../wireless/broadcom/brcm80211/brcmfmac/core.c    |   5 +-
>  .../wireless/broadcom/brcm80211/brcmfmac/core.h    |  18 +
>  .../wireless/broadcom/brcm80211/brcmfmac/feature.c | 124 ++++-
>  .../wireless/broadcom/brcm80211/brcmfmac/feature.h |   2 +
>  .../wireless/broadcom/brcm80211/brcmfmac/fweh.c    | 130 ++++-
>  .../wireless/broadcom/brcm80211/brcmfmac/fweh.h    |   1 +
>  .../broadcom/brcm80211/brcmfmac/fwil_types.h       | 141 +++++-
>  .../wireless/broadcom/brcm80211/brcmfmac/msgbuf.c  |  65 ++-
>  .../wireless/broadcom/brcm80211/brcmfmac/msgbuf.h  |   9 +-
>  .../wireless/broadcom/brcm80211/brcmfmac/pcie.c    | 560 +++++++++++++++=
++----
>  .../broadcom/brcm80211/brcmfmac/scan_param.c       | 416 +++++++++++++++
>  .../broadcom/brcm80211/brcmfmac/scan_param.h       |  13 +
>  .../broadcom/brcm80211/include/brcm_hw_ids.h       |   2 +
>  .../broadcom/brcm80211/include/chipcommon.h        |   5 +
>  19 files changed, 1593 insertions(+), 339 deletions(-)
> ---
> base-commit: 42a9fb3382fc2573e92f41d203b095d9a372cfc9
> change-id: 20260925-brcm4388-submit-5cb8d3e6d6a5
>

Works for me and looks good.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
