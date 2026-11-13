Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794602867;
	b=pDeZOPrRwWlGaDQTpCLgBbfHagzQybE2rQU1NTu36QzSaL4V6nEUYJzCCn6C701g6TY3
	 9NBvPQ2UJxN4hVyAL5zsVTV9ShxHjgOBDZaq8tXDx3MIaqEaEUMT4VjafKSM8g9TlpYSY
	 548sxJyVrvEdvT51yPoj+0PeNd5miH4KcfH9CqftXWq6BLW3idczHp8ECE0H2k3sn5kBq
	 96FEs5dDohwguU+lkexrZTEoogRYjytZIs4YePssrGa6AoBnSpUduYNb/UscVdrPi7b7a
	 TWShHC1jJRv8uh7MQwgWOMQXJnUQFiQpFovQO03EASxhhL6sE2oHWUMcZSGDacV9o/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794602867;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YqOyLeJF1LZn52GyfM0b3GDfTRLm5jSkYKCfEBCotc0=;
	b=cwBoja+xjld9WRmihbQAOsASLsDJzzCh4eCwSAihQRDDGmUyxS/uFOyDUb81kTSlYwyx
	 dYDsaGOEwzbHXSGxJGqE3hgYoc+Q6BoZ6KarwPe4jhqbvCJf4s8YVTE/nfGmJOtMHQOVn
	 3Z8MLv7zqe6sfzNF6Ai+Up89YYwsNBfFJmWLTWMM5QjVMFYRtiXV7jKOjdvyJj96Vc00Q
	 E62ww1pc3hIz12m2RBBHd01y4a6/uVAhvyCumGyJwDkJZrur1+FUfogufpXX/S17hZXSs
	 kMAShgLTEWDv+12ipUKsgMM0qv+JOJrufb2Bc1rkYIWeItOyC+cjVvfhe9e3temjDUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gompa.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA92C606A337
	for <asahi@lists.linux.dev>; Fri, 13 Nov 2026 20:47:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA92C606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-53639b8903bso30064911cf.0
        for <asahi@lists.linux.dev>; Fri, 13 Nov 2026 12:47:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794602865; x=1795207665;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YqOyLeJF1LZn52GyfM0b3GDfTRLm5jSkYKCfEBCotc0=;
        b=bE9htwjVZ9adchdirIFAa+ibMatGEBIBGAoveLur6A7cuGDFFgR8i41MDUaGAOq4EL
         s2vkwAAO3snJtfdzpiRgh6O6vfGw6B1zBN2rrwjB45KYTgJE9xjSPRtJILhAyd2nP1oM
         ZVYcGlJlADOyIKIJVwLXdQiJAf9Jygo5D/XYuCD9l/1iFNzwT+tKKvwVM7ujZHdNrVLf
         ANJDbhLwnJjiYleEz6E5t5pxM38d9KD16Lb9F+PFix+dZvAYrqnCtvBKlD6LIH4dvpQo
         eZ7SvvPy4bAeQduEcTIMKF9DPl7sdF7vVO3NeM1guob7f6A/OQ7YYXnoClIdq6s+Lvu0
         PDSA==
X-Forwarded-Encrypted: i=1; AL+hErEUB2f4SjVXqV6tinQLYGYmCdbbIP8ArD3GJnDiNUW6bA7Yv4Jb3LnPVMNGAcQM8o/W8VPExA==@lists.linux.dev
X-Gm-Message-State: APuU4Z+oR8hBoleMss9N7QyWtGbWO7gPpdYFxuqKf9WrU3e1oA9//dZa
	0+9leRpdOrYNELskSt2+w1fn8OEfyuJSzryPLCRi9sEhmv283zIwl/l5JrgQ+qiJ
X-Gm-Gg: AYBFou0QA0VSu3j+96B0QAPgy6iuLLneg2a5DNM/9TiJ+gjbnm5LVWiETKE/tLK+lEM
	KnqUZwWvDoiiTGzjGRVrhO49gytLmjpA91uqqqeRKK+dqtD8BJF9lzG5Y1y6b+pIA8Ml6LtqKo8
	kzcLV86DZ6Hn4eGct25IHdpnOSTEnOiRxXSPd/GVWREoZyW/D/yl5S/aKQaE8mQFG4Syl0oICfa
	UVDTN2ewEvcEcz6wb3cnSNGE0VFrjGLJBga5gR3ztiLO9woxDam0Vzqk3re/X04r6xDwTlvt/+x
	TdVZWB/hWp/sjdUG/EnegEd7sSj9Op6zT7zLPEDpkQR3hyU4kFcPOin8PmrXd3jxeQ13AoQT2Sg
	96fw5wHihhxwneZ3hRwV23ld/CeghyTT3Kqps15cx62NiruuWG8Brse0F6uwX1LlfdiiaHu9NLE
	R18pij9rGY5JfMK9x4aVSRqoHtoSNjfsjXBbv35AR2rAkU08TG1waOA41ZA6vWzkEas4t2n4pMs
	UBFGSKKsPhs+xDtAJIeBf4Su1Az3ltf29dphFLe/zENft0YFJOqc9q62GfcLwoDpJOWeRc2a91z
	oRE0oIx8mja73euVCKrGwnhFm65kWBOkOmPGxjQnqZZdCYby2/bg1d0OUQBP2k0o1AAw4vUylkX
	Yt/yexveihwDMoW7AUhPgGv5abArxHwveNQNA0scWiMDyr8fD/rnKIYGcrHw08rGQoDI55RFOx5
	bNJb/So3qQnaMGMervt65mbA==
X-Received: by 2002:ac8:5d8f:0:b0:535:b545:e926 with SMTP id d75a77b69052e-55956e5d8a7mr114869731cf.27.1794602865289;
        Fri, 13 Nov 2026 12:47:45 -0800 (PST)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com. [209.85.219.42])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d4577csm28962666d6.13.2026.11.13.12.47.45
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 12:47:45 -0800 (PST)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-91ea5600c9cso32858386d6.1
        for <asahi@lists.linux.dev>; Fri, 13 Nov 2026 12:47:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGEr1qOsBJ2oF4TKq2D0ZwmUOze4YLnQe9tvDzHMfR4xysE3NCJ1Q4Vcc4uEbwy8RAONdC+UQ==@lists.linux.dev
X-Received: by 2002:a05:6830:1cc2:b0:7f9:555:1df0 with SMTP id
 46e09a7af769-86289878845mr2035460a34.12.1794602431926; Fri, 13 Nov 2026
 12:40:31 -0800 (PST)
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261108-b4-apple-mtp-keyboard-v5-0-e2c97b82669a@gmail.com>
In-Reply-To: <20261108-b4-apple-mtp-keyboard-v5-0-e2c97b82669a@gmail.com>
From: Neal Gompa <neal@gompa.dev>
Date: Fri, 13 Nov 2026 15:39:55 -0500
X-Gmail-Original-Message-ID: <CAEg-Je9ffh8v9PKn-pRc7DLjD0h9oP64ZB_FR5B0K=YfctJx2w@mail.gmail.com>
X-Gm-Features: AclHuK99xhj_lrjZso--3IknqiDF9swsBuRbZJPQdiHng0qFnjGS4Y8OcMsuew0
Message-ID: <CAEg-Je9ffh8v9PKn-pRc7DLjD0h9oP64ZB_FR5B0K=YfctJx2w@mail.gmail.com>
Subject: Re: [PATCH v5 0/8] Add support for Apple Silicon DockChannel internal keyboards
To: michael.reeves077@gmail.com
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-input@vger.kernel.org, 
	Yureka Lilian <yureka@cyberchaos.dev>, Hector Martin <marcan@marcan.st>, 
	Sasha Finkelstein <k@chaosmail.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 8, 2026 at 2:25=E2=80=AFAM Michael Reeves via B4 Relay
<devnull+michael.reeves077.gmail.com@kernel.org> wrote:
>
> This series introduces support for the internal keyboards on Apple
> Silicon M2 and M3 MacBook models.
>
> On these platforms, built-in input devices are managed by a dedicated
> coprocessor running an RTKit-based operating system. Communication
> between this coprocessor and the main processor is carried out over a
> low-latency hardware byte FIFO interface called DockChannel.
>
> To support this input path, the series introduces a few new components:
> - An apple-dockchannel mailbox driver to handle the low-level
>   byte-stream FIFO.
> - A DockChannel HID transport driver (apple-hid) that boots the
>   coprocessor using the RTKit framework and encapsulates the HID
>   protocol over the mailbox.
> - Minor additions to the apple-rtkit and hid-apple drivers to support
>   the TraceKit endpoint and integrate the keyboards into the existing
>   input-quirks framework.
> - Devicetree bindings and DTS updates to describe the nodes on M2 and
>   M3 laptops.
>
> The transport driver is based on an original out-of-tree implementation
> by Hector Martin, but it has been significantly rewritten for upstream
> inclusion to use the standard Linux mailbox framework and align better
> with upstream HID design patterns and reduce reliance on hacks.
>
> While the coprocessor manages both the keyboard and the trackpad, this
> series only enables keyboard support. The keyboard can be initialised
> without loading external firmware, whereas the trackpad requires
> firmware. Trackpad support will be submitted in a subsequent series
> once these base transport layers are established.
>
> Tested on: MacBook Air M3 (J613).
>
> Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
>
> Changes in v5:
> - Link to v4: https://lore.kernel.org/all/20260925-apple-mtp-keyboard-fin=
al-v4-0-304c267518f4@gmail.com/
> - Drop ASC mailbox and DART binding patches which were picked up and are =
in apple-soc/dt-7.5
> - Simplify HID transport reg-names from coproc-asc/sram to asc/sram (sugg=
ested by Rob Herring).
> - Replace the empty STM child node with the 'apple,has-stm' boolean prope=
rty (suggested by Rob Herring).
> - Drop the keyboard child node and move 'hid-country-code' to the parent =
node (suggested by Rob Herring).
> - Simplify the transport driver to filter supported interfaces in C and d=
rop fwnode handling.
> - Collect Reviewed-by from Rob Herring on the DockChannel mailbox binding=
.
> - Rebase on v7.4-rc1
>
> Changes in v4:
> - Link to v3: https://lore.kernel.org/all/20260918-apple-mtp-keyboard-fin=
al-v3-0-e356464e454b@gmail.com/
> - Describe the DockChannel interrupt pair in DT (suggested by Yureka Lili=
an).
> - Serialize command transactions and finish STM setup before signalling r=
eady.
> - Keep IRQ flag reads and acknowledgements under the controller lock.
> - Clarify teardown synchronization and use the explicit-bounds HID API.
> - Preserve interface-start errors and allow waiting again for delayed rea=
diness.
> - Simplify FIFO writes, IRQ startup and compatible matching.
> - The command and IRQ changes address Sashiko feedback.
>
> Changes in v3:
> - Link to v2: https://lore.kernel.org/all/20260918-apple-mtp-keyboard-fin=
al-v2-0-a5c685e50b60@gmail.com/
> - Fix failed-probe cleanup and interface publication ordering.
> - Fix report lengths/types and reject replacement descriptors.
> - Terminate serial replies and encode checksums as little endian.
> - Honor HID_QUIRK_IGNORE_SPECIAL_DRIVER.
> - Clarify the DockChannel TX byte register layout.
> - All changes above address Sashiko feedback.
>
> Changes in v2:
> - Link to v1: https://lore.kernel.org/asahi/20260630-apple-mtp-keyboard-f=
inal-v1-0-506d936a1707@gmail.com/
> - Rebase onto latest upstream and add M3 Pro/Max device-tree support.
> - Use an optional STM node to decide whether to wait for device IDs
>   (suggested by Yureka Lilian).
> - Rename bindings to match the t8112 fallback (suggested by Conor Dooley)=
.
> - Fix FIFO MMIO write width (suggested by Yureka Lilian) and run mailbox
>   interrupt handling in the IRQ thread.
> - Remove the duplicate report fixup (suggested by Sasha Finkelstein)
>   and redundant HID dependency (suggested by Julian Braha).
> - Fix teardown and the missing HID stop callback; simplify interface look=
up.
>
> ---
> Michael Reeves (7):
>       dt-bindings: mailbox: apple: Add DockChannel mailbox
>       dt-bindings: input: apple: Add DockChannel HID transport
>       mailbox: apple: Add DockChannel FIFO controller
>       HID: apple: Add support for DockChannel HID keyboards
>       HID: apple: Add DockChannel HID transport driver
>       arm64: dts: apple: Add MTP DockChannel HID nodes
>       arm64: dts: apple: Enable DockChannel HID on M2 and M3 laptops
>
> Sasha Finkelstein (1):
>       soc: apple: rtkit: Add tracekit endpoint
>
>  .../input/apple,t8112-dockchannel-hid.yaml         |   92 ++
>  .../bindings/mailbox/apple,t8112-dockchannel.yaml  |   88 ++
>  MAINTAINERS                                        |    5 +
>  arch/arm64/boot/dts/apple/t602x-die0.dtsi          |   47 +
>  arch/arm64/boot/dts/apple/t602x-j414-j416.dtsi     |   24 +
>  arch/arm64/boot/dts/apple/t6030.dtsi               |   47 +
>  arch/arm64/boot/dts/apple/t6031-die0.dtsi          |   47 +
>  arch/arm64/boot/dts/apple/t603x-j514-j516.dtsi     |   19 +
>  arch/arm64/boot/dts/apple/t8112-j413.dts           |   19 +
>  arch/arm64/boot/dts/apple/t8112-j415.dts           |   19 +
>  arch/arm64/boot/dts/apple/t8112-j493.dts           |   21 +-
>  arch/arm64/boot/dts/apple/t8112.dtsi               |   47 +
>  arch/arm64/boot/dts/apple/t8122-j504.dts           |   22 +
>  arch/arm64/boot/dts/apple/t8122-j613.dts           |   22 +
>  arch/arm64/boot/dts/apple/t8122-j615.dts           |   22 +
>  arch/arm64/boot/dts/apple/t8122.dtsi               |   48 +
>  drivers/hid/Kconfig                                |    2 +
>  drivers/hid/Makefile                               |    2 +
>  drivers/hid/dockchannel/Kconfig                    |   14 +
>  drivers/hid/dockchannel/Makefile                   |    3 +
>  drivers/hid/dockchannel/apple-hid.c                | 1167 ++++++++++++++=
++++++
>  drivers/hid/hid-apple.c                            |  118 +-
>  drivers/mailbox/Kconfig                            |   12 +
>  drivers/mailbox/Makefile                           |    2 +
>  drivers/mailbox/apple-dockchannel.c                |  357 ++++++
>  drivers/soc/apple/rtkit.c                          |    2 +
>  include/linux/hid.h                                |    1 +
>  include/linux/mailbox/apple-dockchannel.h          |   29 +
>  28 files changed, 2251 insertions(+), 47 deletions(-)
> ---
> base-commit: 1d368e025d7c4fe63c8bf68ccb4bc3c9772ab75c
> change-id: 20261108-b4-apple-mtp-keyboard-94f1cf08ef11
>

Series LGTM.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
