Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFC327C162
	for <asahi@lists.linux.dev>; Wed,  7 Jan 2026 07:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767770896; cv=none; b=sup644WPasgs+ESO9IJiBH569WTYztFzPMjdSs5EXMF7tSE7ayR9nsNTZEE9WfTtd8xLLsorGSgRHfvTJIBUuEtv+5NWzuOxcOUYUTmKbrO9tUdPduYKWJZOGL/MykpuCLOs5GsFDw6uTSt3wBx45JnCvzozlygz9giTSD/t6/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767770896; c=relaxed/simple;
	bh=RfgEuMNL4TUo/qvInpOgHkNAN7w3Ng98TrXjKaBgOIU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NCKtWBchmU6l2l5DogGGxkYiEy3G5NQ3Cbh8vIGnwWZcvE2DAhPQSQl0OP1KwfHTCsaOfmy2KH/O+Xv/jGR4imAiCztTxR/Av0qUEiZ2B/jHbcILCRBgo0+P1qrnV5r6RgiLKgp494srCknwdt+IMvLTu25HC+AouhpZQEIWUno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7c701097a75so946577a34.3
        for <asahi@lists.linux.dev>; Tue, 06 Jan 2026 23:28:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767770893; x=1768375693;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Eu/A0GfTdEUi+4McTsexKabuBI9bVphLbWuOqGe7DD0=;
        b=IQs7w2BFU3uMOBkGE6QOsh/aVnO67OWq2j/NRsMdPLea5VI6VaREajy6qaowEZ03o0
         U9UgID9+x8VbsY7MICbfhsRjujrgM9DPGz8jpycXHPX1X/Oag6yDlhQz3UBx6w2w648H
         FXXWKS6NDCVIoFyxEaUxjaG1wlsbqcaWfgmFOgebioDibCMibsVC7PbuwUYEqum6HpMT
         qdXPJVAqfgMGDkH4CkuYMPxNnuT7Y9h1x8Y9YD0A42RY6OY/959edk+iz5l77bJzgM4W
         t5CjsNEZ0qg9odbjrjcZycPdD2cdyeIRhHlG4ZcDfp8CnzG0ZGJ1GV6Nzh4Snw4yj0Oh
         BVxA==
X-Forwarded-Encrypted: i=1; AJvYcCUUBJhNJEslrcw0O1E6kWVKrpq9UouDR60peUjspoJr0O/1KuIRG8N0kbgcfKM3CKCpxaKe9A==@lists.linux.dev
X-Gm-Message-State: AOJu0YzqxZGwO1sY/WEVOyDRSfN1xXIKt1Pz5Mc8BBhw/r3Mu8YI/oX5
	74xcN3us7ji4fqXoln3frxysCDSTJjOgP41T0UQFqvQjlFw13yaSnv/owK19UA==
X-Gm-Gg: AY/fxX4TRKUv6O2+OzV1H+K7AtQhXaymzQYnHM7TxSujDO2HrZN+2LWmqE6zPzO0S2y
	4qXiRt9wO3EwjFJ8pquxfPGn8WJE042WKny/u1LCxWVpzYLGVay4mTXLOWzGc4Co8P7eJvDRC+Q
	/1E7bU2Z7xX93kyPEeoRo0cXmGKhBvQ//RUL2ZE6vcMCdhzAVjC/zTlECwoH39311eMMR9f8lfb
	NcPBd22pXMnpWgN7i93xJtLed9baNefJrZjrrvUZo1/c+X0yTYA77joX0bJQIMlg6iXN4dE1raT
	jGdzla7czgI0tX8DX3UxC3p7OHIi0kSFCeCuXwd0a6R55FagA+byoekTOo3vUC0vXA+GrVug43f
	Xez9J3n58ZlFv/lc4wOGrRb/7xDrwF0+aia8r82qK5+Ni5Gj7owdXFYYIERKOnQZoRDl6Wmhg6x
	HEDnLL1h4tntq3dsJHQdEv9raH75SR3nitwH3zuRSIUhVEWmcw5CEQvYZBjW7xYt7EteA6q2Mi
X-Google-Smtp-Source: AGHT+IEPCIHuidK/Z8qgLbcbF76mqCkbZTAHzpdlWFflrWiJrlwN145WeolMrWPMmQ+HRwkraFTTQg==
X-Received: by 2002:a05:6830:2b0f:b0:7c9:5e2e:295b with SMTP id 46e09a7af769-7ce509e9b09mr942021a34.24.1767770892699;
        Tue, 06 Jan 2026 23:28:12 -0800 (PST)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com. [209.85.210.50])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ce47820f06sm2857045a34.11.2026.01.06.23.28.11
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 23:28:12 -0800 (PST)
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7c6d1ebb0c4so1270859a34.1
        for <asahi@lists.linux.dev>; Tue, 06 Jan 2026 23:28:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXd+/jJWJHkhZmFygAv3EqbiyDFVaaRSFLV/oI8YtXswXKKo9ZefpaubSzvPD9D+NJ7+DsmGQ==@lists.linux.dev
X-Received: by 2002:a05:6830:2b07:b0:7c7:59a1:48d5 with SMTP id
 46e09a7af769-7ce5089afafmr879312a34.1.1767770891508; Tue, 06 Jan 2026
 23:28:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260105-b4-macsmc-power-v1-0-62954c42a555@gmail.com>
In-Reply-To: <20260105-b4-macsmc-power-v1-0-62954c42a555@gmail.com>
From: Neal Gompa <neal@gompa.dev>
Date: Wed, 7 Jan 2026 02:27:35 -0500
X-Gmail-Original-Message-ID: <CAEg-Je--qfftNtPgOOU5hsG=6roPeycgSWC+cZkW8EHmLwRx8Q@mail.gmail.com>
X-Gm-Features: AQt7F2qGyZ3wQ07Wyu2P5kUdwfWzPrrW5nKTTTElBM9nakAD7-jOVKbhW0CdPTQ
Message-ID: <CAEg-Je--qfftNtPgOOU5hsG=6roPeycgSWC+cZkW8EHmLwRx8Q@mail.gmail.com>
Subject: Re: [PATCH 0/2] Add Apple Silicon SMC power driver
To: michael.reeves077@gmail.com
Cc: Sebastian Reichel <sre@kernel.org>, Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Hector Martin <marcan@marcan.st>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 5, 2026 at 7:56=E2=80=AFAM Michael Reeves via B4 Relay
<devnull+michael.reeves077.gmail.com@kernel.org> wrote:
>
> This series adds a power supply driver for the Apple SMC found on
> Apple Silicon devices. This allows the kernel to report AC status,
> battery charging status, and power metrics, and modify the charging
> behaviour.
>
> The first patch adds the driver itself, and the second patch wires it
> up to the MFD core.
>
> The driver is based on an original out-of-tree implementation by
> Hector Martin. It has been refactored for upstream inclusion,
> including support for newer SMC firmwares, devices without batteries,
> dynamic property detection and improved state management.
>
> Tested on: Apple M3 (MacBook Air, J613)
>
> Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
> ---
> Michael Reeves (2):
>       power: supply: Add macsmc-power driver for Apple Silicon
>       mfd: macsmc: Wire up Apple SMC power driver
>
>  MAINTAINERS                         |   1 +
>  drivers/mfd/macsmc.c                |   1 +
>  drivers/power/supply/Kconfig        |  11 +
>  drivers/power/supply/Makefile       |   1 +
>  drivers/power/supply/macsmc-power.c | 872 ++++++++++++++++++++++++++++++=
++++++
>  5 files changed, 886 insertions(+)
> ---
> base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
> change-id: 20260105-b4-macsmc-power-d017cc7f53ac
>

LGTM, thanks for this work!

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
