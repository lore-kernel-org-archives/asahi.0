Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205BF321BE
	for <asahi@lists.linux.dev>; Thu, 16 Nov 2023 16:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3b5714439b3so539924b6e.3
        for <asahi@lists.linux.dev>; Thu, 16 Nov 2023 08:02:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700150565; x=1700755365;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vr5Pddkz52KLaIVcaovRBt/aE9k8hc0RxMR8HkFe6f4=;
        b=Ea1I3NBgK3R7i4o+tFvwUXr87nnI428ZmuDWQDPQFiqFAjMUeY743yWLRg+6XfUZDi
         0RFlwy7D3KNY0DJyyBmF0eI424oPrC+nlAwAdetSmiW6bWFPq6iSWAKzNO933zOFxslq
         bgHsyawP1jSpTrixPS3v3ySXsZm5YYj6yxs4v3Z2uvuIyjO7J+YPhp48mhfdAZjtzrzH
         VF6/BJKS9/v1Alf0tl1nmz35qyMeb4IcUhczhBzZ19XVBxYdUe0p/9M3pCaMC5J1Xj5u
         j//Nv/fy6IAdGIMyqWVD907YcZfQnhjaoFPLhpconB/tOXvq2eCfkZV/gzgKfkY6lh9P
         NH0Q==
X-Gm-Message-State: AOJu0YyhpguyKckMKFynkJKMGhDUE9F6T9muWQZUYMRN9Wr/sOj6tPRc
	qNudfl3Mr6LiB13YP1yL3bY=
X-Google-Smtp-Source: AGHT+IEzeg6XYelO6a2TD1JwyM7LdQMSfZEmNUkLmy0GZalsDy39V/BBn/HOvP0ruoVICBYpE09NKg==
X-Received: by 2002:a05:6808:211:b0:3b2:db2d:7b3d with SMTP id l17-20020a056808021100b003b2db2d7b3dmr15956548oie.33.1700150564883;
        Thu, 16 Nov 2023 08:02:44 -0800 (PST)
Received: from Belldandy-Slimbook.infra.opensuse.org (ool-18e49371.dyn.optonline.net. [24.228.147.113])
        by smtp.gmail.com with ESMTPSA id dj11-20020a056214090b00b00671248b9cfcsm1436868qvb.67.2023.11.16.08.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 08:02:44 -0800 (PST)
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
Subject: [PATCH v4 0/1] Enforce 4k sectorize by default for mkfs
Date: Thu, 16 Nov 2023 11:02:23 -0500
Message-ID: <20231116160235.2708131-1-neal@gompa.dev>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Fedora Asahi SIG[0] is working on bringing up support for
Apple Silicon Macintosh computers through the Fedora Asahi Remix[1].

Apple Silicon Macs are unusual in that they currently require 16k
page sizes, which means that the current default for mkfs.btrfs(8)
makes a filesystem that is unreadable on x86 PCs and most other ARM
PCs.

This is now even more of a problem within Apple Silicon Macs as it is now
possible to nest 4K Fedora Linux VMs on 16K Fedora Asahi Remix machines to
enable performant x86 emulation[2] and the host storage needs to be compatible
for both environments.

Thus, I'd like to see us finally make the switchover to 4k sectorsize
for new filesystems by default, regardless of page size.

The initial test run by Hector Martin[3] at request of Qu Wenruo
looked promising[4], and we've been running with this behavior on
Fedora Linux since Fedora Linux 36 (at around 6.2) with no issues.

=== Changelog ===

v4: Fixed minor errors in the cover letter and patch subject

v3: Refreshed cover letter, rebased to latest, updated doc references for v6.7

v2: Rebased to latest, updated doc references for v6.6

Final v1: Collected Reviewed-by tags for inclusion.

RFC v2: Addressed documentation feedback

RFC v1: Initial submission

[0]: https://fedoraproject.org/wiki/SIGs/Asahi
[1]: https://fedora-asahi-remix.org/
[2]: https://sinrega.org/2023-10-06-using-microvms-for-gaming-on-fedora-asahi/
[3]: https://lore.kernel.org/linux-btrfs/fdffeecd-964f-0c69-f869-eb9ceca20263@suse.com/T/#m11d7939de96c43b3a7cdabc7c568d8bcafc7ca83
[4]: https://lore.kernel.org/linux-btrfs/fdffeecd-964f-0c69-f869-eb9ceca20263@suse.com/T/#mf382b78a8122b0cb82147a536c85b6a9098a2895

Neal Gompa (1):
  btrfs-progs: mkfs: Enforce 4k sectorsize by default

 Documentation/Subpage.rst    | 15 ++++++++-------
 Documentation/mkfs.btrfs.rst | 13 +++++++++----
 mkfs/main.c                  |  2 +-
 3 files changed, 18 insertions(+), 12 deletions(-)

-- 
2.39.2

