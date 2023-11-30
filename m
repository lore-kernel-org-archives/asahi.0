Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8236C4CB2D
	for <asahi@lists.linux.dev>; Thu, 30 Nov 2023 03:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-54b545ec229so335368a12.0
        for <asahi@lists.linux.dev>; Wed, 29 Nov 2023 19:39:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701315567; x=1701920367;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bQP1qqNba8IhD9QjDsAo6CwQPCHKTZzSvNK1nrtQJzI=;
        b=oLnUWjHNdTWO6gg5HMIVdp9SBpty56JnMfpa1dssi8u33GHMbGeMIZpcNCA6b7A/bR
         4kdKWqOGe/SI6BXY7ssXCYVXeM1r2UNiKa//pbDcO/PSkI4QZv9uRtgJwXiiJUPaBxVn
         wI4x6tdaEXiZ6xwb5L3EJAG/RNNvu3enN1LmPHU9Nonx8JIbfSG6AKx0HVVMs90gckI0
         dw29f/z+T3em+g6JFBtxl/qgvQHd41kHvYBZwv7bxVAYjOZlN81aslyVLtZLgYD42T4a
         el3eU8+TQn3+a95xFmco3MS1AfZFnExSFppvier7bOAiKCB+gIBlg4n50jxjgzK2FVvg
         fQnw==
X-Gm-Message-State: AOJu0YwUm48ooILNlduRNm5G7fHF9SF8zQ5QwHt00Tib5ce89D1qpSiq
	46+pYu62YcU6AiuVVBdM7z87cjDmFhaYzadn
X-Google-Smtp-Source: AGHT+IEeLKWwh9GYYU0DJTfqCxqd4Uac9gmvzFYuUMgZQrbg4YxW2g/3dnuEL8fvgaylA+rhklEJ9g==
X-Received: by 2002:aa7:cf89:0:b0:54b:2a9e:3b28 with SMTP id z9-20020aa7cf89000000b0054b2a9e3b28mr10665787edx.22.1701315566800;
        Wed, 29 Nov 2023 19:39:26 -0800 (PST)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id w24-20020a50fa98000000b0054ac62f1638sm110334edr.46.2023.11.29.19.39.26
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Nov 2023 19:39:26 -0800 (PST)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a132acb67b5so61530366b.3
        for <asahi@lists.linux.dev>; Wed, 29 Nov 2023 19:39:26 -0800 (PST)
X-Received: by 2002:a17:906:510:b0:9be:30c2:b8ff with SMTP id
 j16-20020a170906051000b009be30c2b8ffmr13359405eja.61.1701315565815; Wed, 29
 Nov 2023 19:39:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231116160235.2708131-1-neal@gompa.dev> <20231127160705.GC2366036@perftesting>
 <fb78d997-cb99-4b98-8042-bdcdbff22b88@marcan.st> <f229058e-4f5d-4bd0-9016-41b133688443@suse.com>
 <CAEg-Je8r0K0k8UMcAafxXyrNuxJrxJbGhkwvo10pUw+rxhCa8g@mail.gmail.com>
 <aaee6d4f-4e89-4bc7-8a7e-03ffc8b81a34@marcan.st> <c87f6f12-15ef-4860-a3c8-7038c51eddb1@gmx.com>
In-Reply-To: <c87f6f12-15ef-4860-a3c8-7038c51eddb1@gmx.com>
From: Neal Gompa <neal@gompa.dev>
Date: Wed, 29 Nov 2023 22:38:48 -0500
X-Gmail-Original-Message-ID: <CAEg-Je_fQ0Q832UkvrShG61Ff93ctQ8VE+M4PBbYXk0uuqpWxQ@mail.gmail.com>
Message-ID: <CAEg-Je_fQ0Q832UkvrShG61Ff93ctQ8VE+M4PBbYXk0uuqpWxQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/1] Enforce 4k sectorize by default for mkfs
To: Qu Wenruo <quwenruo.btrfs@gmx.com>
Cc: Hector Martin <marcan@marcan.st>, Qu Wenruo <wqu@suse.com>, Josef Bacik <josef@toxicpanda.com>, 
	Linux BTRFS Development <linux-btrfs@vger.kernel.org>, Anand Jain <anand.jain@oracle.com>, 
	David Sterba <dsterba@suse.cz>, Sven Peter <sven@svenpeter.dev>, 
	Davide Cavalca <davide@cavalca.name>, Jens Axboe <axboe@fb.com>, Asahi Lina <lina@asahilina.net>, 
	Asahi Linux <asahi@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 29, 2023 at 3:28=E2=80=AFPM Qu Wenruo <quwenruo.btrfs@gmx.com> =
wrote:
>
>
>
> On 2023/11/29 23:28, Hector Martin wrote:
> >
> >
> > On 2023/11/29 6:24, Neal Gompa wrote:
> >> On Tue, Nov 28, 2023 at 2:57=E2=80=AFPM Qu Wenruo <wqu@suse.com> wrote=
:
> >>>
> >>>
> >>>
> >>> On 2023/11/29 01:31, Hector Martin wrote:
> >>>>
> >>>>
> >>>> On 2023/11/28 1:07, Josef Bacik wrote:
> >>>>> On Thu, Nov 16, 2023 at 11:02:23AM -0500, Neal Gompa wrote:
> >>>>>> The Fedora Asahi SIG[0] is working on bringing up support for
> >>>>>> Apple Silicon Macintosh computers through the Fedora Asahi Remix[1=
].
> >>>>>>
> >>>>>> Apple Silicon Macs are unusual in that they currently require 16k
> >>>>>> page sizes, which means that the current default for mkfs.btrfs(8)
> >>>>>> makes a filesystem that is unreadable on x86 PCs and most other AR=
M
> >>>>>> PCs.
> >>>>>>
> >>>>>> This is now even more of a problem within Apple Silicon Macs as it=
 is now
> >>>>>> possible to nest 4K Fedora Linux VMs on 16K Fedora Asahi Remix mac=
hines to
> >>>>>> enable performant x86 emulation[2] and the host storage needs to b=
e compatible
> >>>>>> for both environments.
> >>>>>>
> >>>>>> Thus, I'd like to see us finally make the switchover to 4k sectors=
ize
> >>>>>> for new filesystems by default, regardless of page size.
> >>>>>>
> >>>>>> The initial test run by Hector Martin[3] at request of Qu Wenruo
> >>>>>> looked promising[4], and we've been running with this behavior on
> >>>>>> Fedora Linux since Fedora Linux 36 (at around 6.2) with no issues.
> >>>>>>
> >>>>>
> >>>>> This is a good change and well documented.  This isn't being ignore=
d, it's just
> >>>>> a policy change that we have to be conservative about considering. =
 We only in
> >>>>> the last 3 months have added a Apple Silicon machine to our testing
> >>>>> infrastructure (running Fedora Asahi fwiw) to make sure we're getti=
ng consistent
> >>>>> subpage-blocksize testing.  Generally speaking it's been fine, we'v=
e fixed a few
> >>>>> things and haven't broken anything, but it's still comes with some =
risks when
> >>>>> compared to the default of using the pagesize.
> >>>>>
> >>>>> We will continue to discuss this amongst ourselves and figure out w=
hat we think
> >>>>> would be a reasonable timeframe to make this switch and let you kno=
w what we're
> >>>>> thinking ASAP.  Thanks,
> >>>>
> >>>> Reminder that the Raspberry Pi 5 is also shipping with 16K pages by
> >>>> default now. The clock is ticking for an ever-growing stream of peop=
le
> >>>> upset that they can't mount/data-rescue/etc their rPi5 NAS disks fro=
m an
> >>>> x86 machine ;)
> >>>
> >>> As long as they are using 5.15+ kernel, they should be able to mount =
and
> >>> use their RPI NAS with disks from x86 machines.
> >>>
> >>> The change is only for the default mkfs options.
> >>>
> >>
> >> Right, and the thing is, it's fairly common for the disks to be
> >> formatted from a Raspberry Pi. So until some kind of support for using
> >> any sector size on any architecture regardless of page size lands,
> >> this is going to be a big problem.
> >>
> >
> > Yup, I meant what I said.
> >
> > Someone sets up a rPi5 as a NAS, formats the disk from it, as you would
> > normally when setting up such a thing from scratch. Later, the rPi stop=
s
> > working, as rPis often do. This person's data is now *completely
> > inaccessible* until they find another Raspberry Pi 5 or an Apple Silico=
n
> > laptop.
> Got it.
>
> I am putting too much trust on RPI, as my experience is pretty good so
> far (just for VM hosting and running fstests), thus I though everyone
> would just go x86->aarch64, at least for NAS hosting/VM testing...
>
> >
> > This is going to be *common*. And since the 16K decision is made at
> > format time, these people are going to be oblivious until they find
> > themselves with an urgent need to acquire a Raspberry Pi 5 to access
> > their data at all, and then they're going to be mad. So the longer you
> > wait to flip the switch, the more people unaware of their own data's
> > fragile accessibility condition you will build up, and the more upset
> > people you're going to have even long after the change was finally made=
.
>
> In that case, I'm totally fine to support the switch of default sector
> size, sooner than later.
>
> With Asahi already running 4K sector sizes, and I have not received any
> death thread for the loss of one's data, I believe the prerequisite for
> the switch is already here.
>
> And even if there are hidden bugs, default to 4K is in fact going to
> make it faster to get reports and fixed.
>

For what it's worth, this change was applied at the Fedora level, so
*all* architectures have been using 4k sectorize by default for some
time now, including Fedora Asahi (ARM 16k) and Fedora POWER (64k).


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
