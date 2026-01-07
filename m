Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478F227464F
	for <asahi@lists.linux.dev>; Wed,  7 Jan 2026 07:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767770790; cv=none; b=tpCKP05Cgc6Xm8h4hlkXPFXtgcF/AZCjbOn+cY+Ty5BXc4DgX0RSG75TitpM3wHLO2eeqfpprI0+OOMiXjj8zKqJoTy6E5zXk8p1f/u1dqzdgBCHd2roDqx7ilCi4x0RSCMatByZfmKRXgMbrv5QV4GRH56vR1kdYi7Hww0hhx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767770790; c=relaxed/simple;
	bh=mX5mig8/BFt3x760MBESNiQZU0qAhjL3oIZAy9T+tko=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g2xlNmNx+XLDmZJ++yLCugVVhyLnn0WdideY0yeJWhOF2AKum2QG11wfTzKP9E2Ld8cfCVx0Ik7qDNS6geR6u5pqQ7L9QJhPirlNN8eq4FFcrgXkxdnyW56gKGfHFE9mZ0m+UQdILfVhQl9KTezzIDOQ7xDc7qaEFm3hqT9/Myw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7ce0ef9d4eeso742651a34.1
        for <asahi@lists.linux.dev>; Tue, 06 Jan 2026 23:26:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767770787; x=1768375587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Twe1C1BbPg2woexDagJv2HCcDGXNh4FadpJITTB224w=;
        b=iFY0HJKSf1VXptriNG7aTzJnyfyEWPigEEMa2y10/QaJAWVkNwmoMEYFs4l0JwcqOR
         s9frbK/aqIcwkNLo0iltgFDB8MSjuEZQ14g9Cpy9VoWB/uVjW2IVcapzDkA93rXnGRul
         1XSo5txtY3lvD6z3AAheqY+j3ZqJXNrrd7ZUE2V6deG+pszumHVLbg+z7a35+nKaSLH3
         Ube6a5lHfERUNNl7VO8KWAo5ZZodaKXXEcuo+hzD/Zhr0LAi4suIqe4dMUlxALh1pKsI
         TU4FoWwz/RN1OS/whnA9P3CU5OQbZ5G/g7creUhWuhbruxPb4Ju7dFoLExRGVkLoo/9o
         f4DQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPhq3GoIbdG3D4Pxz2D+Lg2F5+7JbtoPmuKFBbsSiMYk8UAYzUfLxZ5pZVGf2ge0595iAyUw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzVdZasnjUnM2RxkDeJ12xAnaXqZn5b2mE1QmpMDIJ+tc2NtA+D
	/hWFRf+W28+V6WyuFOlk9OQW5uWOdQyFcOA3Hm9cGgefFU0aT5KnCr3gnCAMlg==
X-Gm-Gg: AY/fxX6ixwkSFfMyeCybtsxFy013jn5SAdFvMJXwMCnlPMkwpl5lisJQuJ+BtUkb9ry
	82zw/ZnEO+hxU6/3pXIOMdbwF41hUG/frG0hlg+fzpTchuSmXcjRTlS67EaQlBHnVZEU2Gp3OUn
	XzjJWN0+7uVsAu443bH7TVxHNGflBSouSYBXCB5xSEwdqviHu2lHnA4rxSSr/KWbWo5E182oCJE
	vO/a3DOmL/YVDs+yj4aIvqCMWemnt6/8sMs0hGb/5svuGndIt9Do4ygQuWNzA/aBcVqLJFYKQRL
	j0nTazLR1jgNjMAFSwzA35SAjtawJqaaBfYzaziSU0gziot0VzCSwA5IksYL7OshbElAYwZWReT
	Q3zSzK6YCaMCQaKA1TAtoQvx/3/YiUkzte465V1tH8oqPt2bJJtOWCUZoJxQI1Ez3g4sbbIYmWI
	gN2lNBk/FTvmwoWywZWfzzZMQS0r/le349JteDVXe5/spEvaNs7GMGsNDNpERgVFThvmCqPZ8K
X-Google-Smtp-Source: AGHT+IEabD/K6Q5DWJyWFYM5SOJyKX86YO4PIZ651kcoG2zhehhU7a25KxBki6yjnQWoTZlp7tV+9Q==
X-Received: by 2002:a05:6830:448d:b0:7c9:57ff:4cdf with SMTP id 46e09a7af769-7ce50bef39emr663130a34.25.1767770786698;
        Tue, 06 Jan 2026 23:26:26 -0800 (PST)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com. [209.85.210.48])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ce478d9c2esm3010651a34.21.2026.01.06.23.26.26
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 23:26:26 -0800 (PST)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7ce0ef9d4eeso742642a34.1
        for <asahi@lists.linux.dev>; Tue, 06 Jan 2026 23:26:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVj6MP4/mR5LFagBBgbYe+iiqW8qbEjcruCYQMElDZQrtwEUViDf3ba47SQjMjujucntFlwAQ==@lists.linux.dev
X-Received: by 2002:a05:6830:4426:b0:7ce:2b15:de88 with SMTP id
 46e09a7af769-7ce50bf0a1bmr888031a34.26.1767770786197; Tue, 06 Jan 2026
 23:26:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260105-asahi-tests-wave1-v1-0-a6c72617e680@jannau.net>
In-Reply-To: <20260105-asahi-tests-wave1-v1-0-a6c72617e680@jannau.net>
From: Neal Gompa <neal@gompa.dev>
Date: Wed, 7 Jan 2026 02:25:50 -0500
X-Gmail-Original-Message-ID: <CAEg-Je-Y2y_ibBemxN6ZQdHW-x+_kRa8ymiJ7z_79CHj=zorfQ@mail.gmail.com>
X-Gm-Features: AQt7F2oqU_xLCPULW_gdHypgzwTMbTeHLd2wn-sF13-JYl990OjGigdncta4T_M
Message-ID: <CAEg-Je-Y2y_ibBemxN6ZQdHW-x+_kRa8ymiJ7z_79CHj=zorfQ@mail.gmail.com>
Subject: Re: [PATCH i-g-t 0/3] Add infrastruture and initial tests for ashi
 DRM render driver
To: Janne Grunau <j@jannau.net>
Cc: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>, dri-devel@lists.freedesktop.org, 
	asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 5, 2026 at 4:04=E2=80=AFPM Janne Grunau <j@jannau.net> wrote:
>
> I will start with upstreaming the asahi DRM render driver. The UAPI was
> merged in v6.16-rc1 and the downstream Asahi Linux kernel tree has a
> driver implementing this fully.
> The asahi (OpenGL 4.6 conformant) and honeycomb (Vulkan 1.4 conformant)
> user space drivers using this UAPI are available in mesa since 25.2.
>
> This initial submission contains test infrastructure and tests for the
> ioctl DRM_IOCTL_ASAHI_GET_PARAMS and DRM_IOCTL_ASAHI_GET_TIME.
> These two tests are the only ones the initial version of the initial
> upstream submission of the driver will pass.
>
> I have additional tests which the downstream driver passes as well. I
> was planning to submit them together with upstream driver patches which
> implement the necessary functionality for the tests.
>
> If preferred I could submit all tests and gate them based on the driver
> version to avoid expected igt-gpu-tools test failures against
> incomplete (as in not implementing the full UAPI) upstream driver
> versions.
>
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
> Janne Grunau (3):
>       drm-uapi/asahi: Initial import of asahi_drm.h
>       asahi: Add test infrastruture for asahi DRM render driver
>       tests/asahi: Add test for DRM_IOCTL_ASAHI_GET_TIME
>
>  include/drm-uapi/asahi_drm.h   | 1194 ++++++++++++++++++++++++++++++++++=
++++++
>  lib/drmtest.c                  |    1 +
>  lib/drmtest.h                  |    1 +
>  lib/igt_asahi.c                |   58 ++
>  lib/igt_asahi.h                |   15 +
>  lib/meson.build                |    1 +
>  meson.build                    |    8 +
>  tests/asahi/asahi_get_params.c |   55 ++
>  tests/asahi/asahi_get_time.c   |   63 +++
>  tests/asahi/meson.build        |   14 +
>  tests/meson.build              |    2 +
>  11 files changed, 1412 insertions(+)
> ---
> base-commit: cef45b995557367ba082bc460fbab2190af943fd
> change-id: 20260105-asahi-tests-wave1-7a850d0e0af0
>

This series looks great to me.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
