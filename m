Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139A1156FE
	for <asahi@lists.linux.dev>; Tue,  2 Jan 2024 18:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BpHH2EDn"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2cca8eb0509so85520151fa.3
        for <asahi@lists.linux.dev>; Tue, 02 Jan 2024 10:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704220811; x=1704825611; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hi/vkiq78X0yzEwfWzDqipOcXVRGcQevtOptU3VRDoU=;
        b=BpHH2EDnanKyLAqKhnxb4egjar9lObcG5fmrB2RJ/37HFXyNjGLWwgJCb+RAl3RSL5
         e111NSv8kN2Dtp8MdjxXRBUtBDoIqC9FVm8hTLUYGaUfRoU8M9IP9Avkqg23LIKHpljM
         C8UOzZLlGxxxRAhDgxpuHBF5xas2gCv1cUsxb2bv2icr7pMQbJrAerNPjwudz7TQbMq+
         DhhUpavy+tDPJ5MHiIdYkNiO9FJq9qWuo1Et3DoPsVh+auFeL8CvLgEPPn5CJDnq4DeY
         P/ObxqXixTnfoCKJFBcDfcQMSjCK5XItLnplElNfNUVV0msKI2AhF8JTu3ucfF3p2XCu
         JWbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704220811; x=1704825611;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hi/vkiq78X0yzEwfWzDqipOcXVRGcQevtOptU3VRDoU=;
        b=MdBCWyTq2kvGJARul6JHdIVPTMokRztHdzIrtaJRe+qkDi4PaI/BbL5IIfybjWT2DJ
         0p8an745FmHLdBaEGu2qFvpMmkp4RUCVgVShjadyjTLqwXOqDo2iLBJTLIr3qIAAmLPE
         LYN1aQ1YcWZel8wMypIyja3nqRtfUmjELOc8K7FNfYpKKZOUHMzPpAzty4ik2mIon9K7
         Gzt2w/+NcWlseEVzLya2s35OD0YkMAs7PhWptyovUrvavJ/MT26ZPCuuJWKCSMMnqDoU
         3YzVmvdiVv5ZWjk+5ZLCjNOXuEq4znm/KaU353SZCZQz36wg9vzF/xftJqSCJZ9wUUQG
         lWZQ==
X-Gm-Message-State: AOJu0YxkR0hX7m3omobSq6d7EkOwaf2rjG6Iyz3C0g1BvIIe5RLCMQyk
	pKN9eO485h4twR/ZxCCWxy29UMjXodQGMwqcvWI=
X-Google-Smtp-Source: AGHT+IEucWctf1n9df5Yb6yWXLi6BW+gSmfIgPxnXufEaYgrcM35uHM13oukW9MfN5nEiH6X3XJLisPQ5YnD8SB+11I=
X-Received: by 2002:a2e:b791:0:b0:2cc:7a2e:28f4 with SMTP id
 n17-20020a2eb791000000b002cc7a2e28f4mr7346388ljo.88.1704220810795; Tue, 02
 Jan 2024 10:40:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240102181946.57288-1-verdre@v0yd.nl>
In-Reply-To: <20240102181946.57288-1-verdre@v0yd.nl>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Tue, 2 Jan 2024 13:39:58 -0500
Message-ID: <CABBYNZ+sTko6reoJO43W2LHGW58f0kK_8Zgc3mep7xki355=iA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] Power off HCI devices before rfkilling them
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
> In theory the firmware is supposed to power off the bluetooth card
> when we use rfkill to block it. This doesn't work on a lot of laptops
> though, leading to weird issues after turning off bluetooth, like the
> connection timing out on the peripherals which were connected, and
> bluetooth not connecting properly when the adapter is turned on again
> quickly after rfkilling.
>
> This series hooks into the rfkill driver from the bluetooth subsystem
> to send a HCI_POWER_OFF command to the adapter before actually submitting
> the rfkill to the firmware and killing the HCI connection.
>
> ---
>
> v1 -> v2: Fixed commit message title to make CI happy
>
> Jonas Dre=C3=9Fler (4):
>   Bluetooth: Remove HCI_POWER_OFF_TIMEOUT
>   Bluetooth: mgmt: Remove leftover queuing of power_off work
>   Bluetooth: Add new state HCI_POWERING_DOWN
>   Bluetooth: Queue a HCI power-off command before rfkilling adapters

Apart from the assumption of RFKILL actually killing the RF
immediately or not, I'm fine with these changes, that said it would be
great if we can have some proper way to test the behavior of rfkill,
perhaps via mgmt-tester, since it should behave like the
MGMT_OP_SET_POWERED.

>  include/net/bluetooth/hci.h |  2 +-
>  net/bluetooth/hci_core.c    | 33 ++++++++++++++++++++++++++++++---
>  net/bluetooth/hci_sync.c    | 16 +++++++++++-----
>  net/bluetooth/mgmt.c        | 30 ++++++++++++++----------------
>  4 files changed, 56 insertions(+), 25 deletions(-)
>
> --
> 2.43.0
>


--=20
Luiz Augusto von Dentz
