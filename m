Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49C1D30A
	for <asahi@lists.linux.dev>; Tue, 21 Mar 2023 18:06:43 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id r16so18935066qtx.9
        for <asahi@lists.linux.dev>; Tue, 21 Mar 2023 11:06:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679422002;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=412pzojuSE2f0w3DYVguk4c8qRm7lPnYodGxkNfunN0=;
        b=DGn7unHUi8IKPf/YPsHZvJ+LcVfwCLEKiVBiGQoUAnLmFNy+JNfmtRlTfu2xIWK3Bs
         haWCjG0GvKZY2MURNfwT4vqNqnDRP3NM/pqzWa5PI8l9af1WTvTudodTtco2w6Mn/eSV
         M4hdHSGIkMAT/w8yy9aewcK7rSJBCjYLAyJi2JT0wmNjpFlLN86NsNwtMCqvSsq0VT6j
         9H3cmqpS0rL7UWGMBUeoTV4bXeKQRzn+akMTrmT04EBfBQoZV5zORQXEDhtndGf69RJ1
         WZohuj3zhdEFA+FwVe91+3jGotIyV8XyMYSic2cbf9L3ZQoFaWoT3fXAwVP1eR82druA
         iS6w==
X-Gm-Message-State: AO0yUKWymmoWQHhJ5H03QXbOd/Jt2yjUxSTNLzinwx4XQp9pqTK1nX0n
	Rv5w/xuaXhtS2bBQ7m0Mw3U=
X-Google-Smtp-Source: AK7set9+2p6eGp3S7sZ795vZUEMHFSO3IYC1ylRSkBax4pZ2Y2akTUJTXlMr3SaBE0KhhgdIPxkjQw==
X-Received: by 2002:ac8:5b95:0:b0:3b8:340b:1aab with SMTP id a21-20020ac85b95000000b003b8340b1aabmr1291066qta.25.1679422002405;
        Tue, 21 Mar 2023 11:06:42 -0700 (PDT)
Received: from Belldandy-Slimbook.infra.opensuse.org (ool-18e49371.dyn.optonline.net. [24.228.147.113])
        by smtp.gmail.com with ESMTPSA id 84-20020a370c57000000b0074698d81ffasm2328796qkm.44.2023.03.21.11.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 11:06:42 -0700 (PDT)
From: Neal Gompa <neal@gompa.dev>
To: Linux BTRFS Development <linux-btrfs@vger.kernel.org>
Cc: Neal Gompa <neal@gompa.dev>,
	Anand Jain <anand.jain@oracle.com>,
	Qu Wenruo <quwenruo.btrfs@gmx.com>,
	Qu Wenruo <wqu@suse.com>,
	David Sterba <dsterba@suse.cz>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Davide Cavalca <davide@cavalca.name>,
	Jens Axboe <axboe@fb.com>,
	Asahi Lina <lina@asahilina.net>,
	Asahi Linux <asahi@lists.linux.dev>
Subject: [RFC PATCH v2 0/1] Enforce 4k sectorize by default for mkfs
Date: Tue, 21 Mar 2023 14:06:09 -0400
Message-Id: <20230321180610.2620012-1-neal@gompa.dev>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Fedora Asahi SIG[0] is working on bringing up support for
Apple Silicon Macintosh computers through the Asahi Fedora Remix[1].

Apple Silicon Macs are unusual in that they currently require 16k
page sizes, which means that the current default for mkfs.btrfs(8)
makes a filesystem that is unreadable on x86 PCs and most other ARM
PCs.

Soon, this will be even more of a problem within Apple Silicon Macs
as Asahi Lina is working on 4k support to enable x86 emulation[2]
and since Linux does not support dynamically switching page sizes at
runtime, users will likely regularly switch back and forth depending
on their needs.

Thus, I'd like to see us finally make the switchover to 4k sectorsize
for new filesystems by default, regardless of page size.

The initial test run by Hector Martin[3] at request of Qu Wenruo
looks promising[4], and I hope we can get this to land upstream soon.

This is an update on the initial RFC patch[5], which addresses the
documentation feedback from Anand Jain.

[0]: https://fedoraproject.org/wiki/SIGs/Asahi
[1]: https://asahi-fedora-remix.org/
[2]: https://vt.social/@lina/110060963422545117
[3]: https://lore.kernel.org/linux-btrfs/fdffeecd-964f-0c69-f869-eb9ceca20263@suse.com/T/#m11d7939de96c43b3a7cdabc7c568d8bcafc7ca83
[4]: https://lore.kernel.org/linux-btrfs/fdffeecd-964f-0c69-f869-eb9ceca20263@suse.com/T/#mf382b78a8122b0cb82147a536c85b6a9098a2895
[5]: https://lore.kernel.org/linux-btrfs/fdffeecd-964f-0c69-f869-eb9ceca20263@suse.com/T/#t

Neal Gompa (1):
  btrfs-progs: mkfs: Enforce 4k sectorsize by default

 Documentation/Subpage.rst    | 15 ++++++++-------
 Documentation/mkfs.btrfs.rst | 13 +++++++++----
 mkfs/main.c                  |  2 +-
 3 files changed, 18 insertions(+), 12 deletions(-)

-- 
2.39.2

