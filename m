Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6C44439F
	for <asahi@lists.linux.dev>; Tue, 28 Nov 2023 21:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a00a9d677fcso813334766b.0
        for <asahi@lists.linux.dev>; Tue, 28 Nov 2023 13:25:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701206705; x=1701811505;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vmxS5DBFoTg5GQNf3Vd7mws9a9zrp/m1jCwPRvpR82Q=;
        b=vECKwHAyPNusyW+MYRbeQ+8lI1Zn4kuxZZ/Y/c8+IGXXy1WkxDCxAOi64jxm95jTAe
         N+9rnz1CNYZ3JbXlRRAyq1KWKGO2I2IUhwmsN7yu3vOGFLzUk7mgiyB/Ixl6oKutHjCW
         00M2n6gK9vcqR6S1Eh8kMSzTsJBBDCNXH9tLI2aFSX8NMrjDerbiZnEZkIRr/GJPDZv+
         sKQfZyApM5pFOyUjWKro9jJ4S/+H+IcHvsv9lrxZFaH9zGM4JHS0flzXW3mRt4K7nPw6
         8NNrA94Rl3o2XP06HOAzmyWoiyyHYdV+Ipl8LpgmSZafsg6FescwlUp10NITL2xsEPbR
         xshg==
X-Gm-Message-State: AOJu0YzvCYEv7T3ZW9Erm1Fvxf3jro0C1V0Swo3OAt8SHV1W2ePzzVzX
	09rGie0yOJVTwNu3+XXIxkHayisy2Abv4hBa
X-Google-Smtp-Source: AGHT+IE868vciGFx/VVhZMQEYzDXFR8TJiqRu45Gl+UiQjAQ23rG8GUBT47PGC4FGVqzNs54U8tXDA==
X-Received: by 2002:a17:906:190:b0:a16:31b6:f6fd with SMTP id 16-20020a170906019000b00a1631b6f6fdmr1799795ejb.5.1701206704498;
        Tue, 28 Nov 2023 13:25:04 -0800 (PST)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id hg12-20020a170906f34c00b00a10f3030e11sm2057834ejb.1.2023.11.28.13.25.04
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Nov 2023 13:25:04 -0800 (PST)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-54b18dbf148so5161436a12.1
        for <asahi@lists.linux.dev>; Tue, 28 Nov 2023 13:25:04 -0800 (PST)
X-Received: by 2002:a17:906:209c:b0:a12:231f:65d with SMTP id
 28-20020a170906209c00b00a12231f065dmr3886214ejq.48.1701206704110; Tue, 28 Nov
 2023 13:25:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231116160235.2708131-1-neal@gompa.dev> <20231127160705.GC2366036@perftesting>
 <fb78d997-cb99-4b98-8042-bdcdbff22b88@marcan.st> <f229058e-4f5d-4bd0-9016-41b133688443@suse.com>
In-Reply-To: <f229058e-4f5d-4bd0-9016-41b133688443@suse.com>
From: Neal Gompa <neal@gompa.dev>
Date: Tue, 28 Nov 2023 16:24:27 -0500
X-Gmail-Original-Message-ID: <CAEg-Je8r0K0k8UMcAafxXyrNuxJrxJbGhkwvo10pUw+rxhCa8g@mail.gmail.com>
Message-ID: <CAEg-Je8r0K0k8UMcAafxXyrNuxJrxJbGhkwvo10pUw+rxhCa8g@mail.gmail.com>
Subject: Re: [PATCH v4 0/1] Enforce 4k sectorize by default for mkfs
To: Qu Wenruo <wqu@suse.com>
Cc: Hector Martin <marcan@marcan.st>, Josef Bacik <josef@toxicpanda.com>, 
	Linux BTRFS Development <linux-btrfs@vger.kernel.org>, Anand Jain <anand.jain@oracle.com>, 
	Qu Wenruo <quwenruo.btrfs@gmx.com>, David Sterba <dsterba@suse.cz>, 
	Sven Peter <sven@svenpeter.dev>, Davide Cavalca <davide@cavalca.name>, Jens Axboe <axboe@fb.com>, 
	Asahi Lina <lina@asahilina.net>, Asahi Linux <asahi@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 28, 2023 at 2:57=E2=80=AFPM Qu Wenruo <wqu@suse.com> wrote:
>
>
>
> On 2023/11/29 01:31, Hector Martin wrote:
> >
> >
> > On 2023/11/28 1:07, Josef Bacik wrote:
> >> On Thu, Nov 16, 2023 at 11:02:23AM -0500, Neal Gompa wrote:
> >>> The Fedora Asahi SIG[0] is working on bringing up support for
> >>> Apple Silicon Macintosh computers through the Fedora Asahi Remix[1].
> >>>
> >>> Apple Silicon Macs are unusual in that they currently require 16k
> >>> page sizes, which means that the current default for mkfs.btrfs(8)
> >>> makes a filesystem that is unreadable on x86 PCs and most other ARM
> >>> PCs.
> >>>
> >>> This is now even more of a problem within Apple Silicon Macs as it is=
 now
> >>> possible to nest 4K Fedora Linux VMs on 16K Fedora Asahi Remix machin=
es to
> >>> enable performant x86 emulation[2] and the host storage needs to be c=
ompatible
> >>> for both environments.
> >>>
> >>> Thus, I'd like to see us finally make the switchover to 4k sectorsize
> >>> for new filesystems by default, regardless of page size.
> >>>
> >>> The initial test run by Hector Martin[3] at request of Qu Wenruo
> >>> looked promising[4], and we've been running with this behavior on
> >>> Fedora Linux since Fedora Linux 36 (at around 6.2) with no issues.
> >>>
> >>
> >> This is a good change and well documented.  This isn't being ignored, =
it's just
> >> a policy change that we have to be conservative about considering.  We=
 only in
> >> the last 3 months have added a Apple Silicon machine to our testing
> >> infrastructure (running Fedora Asahi fwiw) to make sure we're getting =
consistent
> >> subpage-blocksize testing.  Generally speaking it's been fine, we've f=
ixed a few
> >> things and haven't broken anything, but it's still comes with some ris=
ks when
> >> compared to the default of using the pagesize.
> >>
> >> We will continue to discuss this amongst ourselves and figure out what=
 we think
> >> would be a reasonable timeframe to make this switch and let you know w=
hat we're
> >> thinking ASAP.  Thanks,
> >
> > Reminder that the Raspberry Pi 5 is also shipping with 16K pages by
> > default now. The clock is ticking for an ever-growing stream of people
> > upset that they can't mount/data-rescue/etc their rPi5 NAS disks from a=
n
> > x86 machine ;)
>
> As long as they are using 5.15+ kernel, they should be able to mount and
> use their RPI NAS with disks from x86 machines.
>
> The change is only for the default mkfs options.
>

Right, and the thing is, it's fairly common for the disks to be
formatted from a Raspberry Pi. So until some kind of support for using
any sector size on any architecture regardless of page size lands,
this is going to be a big problem.



--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
